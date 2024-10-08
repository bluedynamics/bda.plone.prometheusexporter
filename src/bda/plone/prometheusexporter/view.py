from App.config import getConfiguration
from plone.memoize.instance import memoize
from Products.CMFCore.utils import getToolByName
from Products.Five.browser import BrowserView
from prometheus_client import Gauge
from prometheus_client import Info
from prometheus_client.exposition import choose_encoder
from prometheus_client.registry import REGISTRY
from prometheus_client.registry import RestrictedRegistry
from ZPublisher.HTTPRequest import WSGIRequest

import pkg_resources
import warnings


server_info = Info("server", "Information about the Zope and Plone server")
core_versions = Info(
    "core_versions", "Versions of the core components of the Plone server"
)
content_stats = Gauge(
    "content_types", "Number of Items by Content Type", ["portal_type"]
)
zodb_size_bytes = Gauge("zodb_size_bytes", "Database Size in Bytes", ["database"])
zodb_size_objects = Gauge(
    "zodb_size_objects", "Database Size in Number of Objects", ["database"]
)
OUTPUTS = [
    "server_info",
    "core_versions_info",
    "content_types",
    "zodb_size_bytes",
    "zodb_size_objects",
]


class MetricsView(BrowserView):
    # code partially copied from
    # https://github.com/plone/Products.CMFPlone/blob/master/Products/CMFPlone/controlpanel/browser/overview.py

    @memoize
    def server_info(self) -> dict[str, str]:
        wsgi = isinstance(self.request, WSGIRequest)
        server_name = "unknown"
        server_version = ""

        server_name = self.request.get("SERVER_SOFTWARE")
        if server_name:
            if "ZServer" in server_name:
                server_name = "ZServer"
            elif "/" in server_name:
                server_name = server_name.split("/")[0]
            try:
                server = pkg_resources.get_distribution(server_name)
                server_version = server.version
            except Exception:
                warnings.warn(
                    "Cannot find or parse version for %r"
                    % self.request.get("SERVER_SOFTWARE"),
                )
        return {
            "server_wsgi": "On" if wsgi else "Off",
            "server_debug_mode": "On" if getConfiguration().debug_mode else "Off",
            "server_name": server_name,
            "server_version": server_version,
        }

    @memoize
    def version_overview(self) -> dict[str, str]:
        migration = getToolByName(self.context, "portal_migration")
        core_versions = migration.coreVersions()
        versions = {}
        versions["Plone"] = "{} ({})".format(
            core_versions["Plone"], core_versions["Plone Instance"]
        )

        for version in ("CMF", "Zope", "Python"):
            versions[version] = core_versions.get(version)
        pil = core_versions.get("PIL", None)
        if pil is not None:
            versions["PIL"] = pil
        return versions

    def content_types(self) -> dict[str, int]:
        catalog = getToolByName(self.context, "portal_catalog")
        index = catalog._catalog.getIndex("portal_type")._index
        return {x: len(index[x]) for x in index}

    def zodb(self):
        dbtab = getConfiguration().dbtab
        for name in dbtab.listDatabaseNames():
            db = dbtab.getDatabase(name=name)
            zodb_size_bytes.labels(name).set(db.getSize())
            zodb_size_objects.labels(name).set(db.objectCount())

    def __call__(self):
        # collect data
        server_info.info(self.server_info())
        core_versions.info(self.version_overview())
        types_sum = 0
        for portal_type, value in self.content_types().items():
            content_stats.labels(portal_type).set(value)
        self.zodb()

        # output
        encoder, content_type = choose_encoder(self.request.getHeader("Accept", ""))
        self.request.response.setHeader("Content-Type", content_type)
        registry = RestrictedRegistry(OUTPUTS, REGISTRY)
        return encoder(registry)

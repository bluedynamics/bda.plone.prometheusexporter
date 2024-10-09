from plone.app.contenttypes.testing import PLONE_APP_CONTENTTYPES_FIXTURE
from plone.app.testing import applyProfile
from plone.app.testing import FunctionalTesting
from plone.app.testing import IntegrationTesting
from plone.app.testing import PloneSandboxLayer
from plone.testing import z2


class PrometheusLayer(PloneSandboxLayer):
    defaultBases = (PLONE_APP_CONTENTTYPES_FIXTURE,)

    def setUpZope(self, app, configurationContext):
        import bda.plone.prometheusexporter

        self.loadZCML(package=bda.plone.prometheusexporter)

    def setUpPloneSite(self, portal):
        applyProfile(portal, "bda.plone.prometheusexporter:default")


PROMETHEUS_FIXTURE = PrometheusLayer()


PROMETHEUS_INTEGRATION_TESTING = IntegrationTesting(
    bases=(PROMETHEUS_FIXTURE,),
    name="PrometheusLayer:IntegrationTesting",
)


PROMETHEUS_FUNCTIONAL_TESTING = FunctionalTesting(
    bases=(PROMETHEUS_FIXTURE,),
    name="PrometheusLayer:FunctionalTesting",
)

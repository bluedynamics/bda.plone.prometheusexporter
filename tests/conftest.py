from bda.plone.prometheusexporter.testing import PROMETHEUS_INTEGRATION_TESTING
from bda.plone.prometheusexporter.testing import PROMETHEUS_FUNCTIONAL_TESTING
from pytest_plone import fixtures_factory


pytest_plugins = ["pytest_plone"]


globals().update(
    fixtures_factory(
        (
            (PROMETHEUS_INTEGRATION_TESTING, "integration"),
            (PROMETHEUS_FUNCTIONAL_TESTING, "functional"),
        )
    )
)

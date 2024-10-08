from bda.plone.prometheus.testing import ACCEPTANCE_TESTING
from bda.plone.prometheus.testing import FUNCTIONAL_TESTING
from pytest_plone import fixtures_factory


pytest_plugins = ["pytest_plone"]


globals().update(
    fixtures_factory(
        (
            (ACCEPTANCE_TESTING, "acceptance"),
            (FUNCTIONAL_TESTING, "functional"),
        )
    )
)

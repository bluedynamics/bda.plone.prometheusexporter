PACKAGE_NAME = "bda.plone.prometheusexporter"
import pytest


class TestSetupUninstall:
    @pytest.fixture(autouse=True)
    def uninstalled(self, installer):
        installer.uninstall_product(PACKAGE_NAME)

    def test_addon_uninstalled(self, installer):
        """Test if addon is uninstalled."""
        assert installer.is_product_installed(PACKAGE_NAME) is False

    def test_browserlayer_not_registered(self, browser_layers):
        """Test that layer is not registered."""
        from bda.plone.prometheusexporter.interfaces import (
            IPrometheusExporterBrowserLayer,
        )

        assert IPrometheusExporterBrowserLayer not in browser_layers

PACKAGE_NAME = "bda.plone.prometheusexporter"


class TestSetupInstall:
    def test_addon_installed(self, installer):
        """Test if kvoltoweb is installed."""
        assert installer.is_product_installed(PACKAGE_NAME) is True

    def test_browserlayer(self, browser_layers):
        """Test that IKVoltoWebBackendBrowserLayer is registered."""
        from bda.plone.prometheusexporter.interfaces import (
            IPrometheusExporterBrowserLayer,
        )

        assert IPrometheusExporterBrowserLayer in browser_layers

    def test_latest_version(self, profile_last_version):
        """Test latest version of default profile."""
        assert profile_last_version(f"{PACKAGE_NAME}:default") == "1000"

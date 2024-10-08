# Prometheus Exporter for Plone

This Plone add-on provides a `/metrics` endpoint on the Zope root, the Plone site root and each navigation-root.

It provides metrics of the ZODB and Plone.

Info:
- [x] Zope version
- [x] Python version
- [x] Plone versions (core)
- [x] debug mode
- [ ] add-ons installed
- [ ] add-ons available

ZODB (per DB):
- [x] Number of objects in the DBs
- [x] Database Size (MB)

Plone content:
- [x] number of objects by type
- [ ] number of objects by state

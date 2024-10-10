# Prometheus Exporter for Plone

This Plone add-on provides a `/metrics` endpoint on Plone site root.

It provides metrics of the ZODB and Plone.

## WIP, Features

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

## Installation

- add `bda.plone.prometheusexporter` to your `requirements.txt` or append it to the `dependencies` list of your `pyproject.toml` file.
- add `bda.plone.prometheusexporter` to the `zcml_package_includes` of your `instance.yaml` or include it in your integration packages `configure.zcml` file.
- (re-)install the dependencies of your project, (re-)run `cookiecutter-zope-instance` 
- start Plone
- in the browser, install the add-on in your Plone sites add-on control panel or depend on the profile `profile-bda.plone.prometheusexporter:default` in your integration packages `profiles/default/metadata.xml` file and (re)-install the integration package profile.

## Source Code

The sources are in a GIT DVCS with its main branches at `github <https://github.com/bluedynamics/bda.plone.prometheusexporter>`_.
There you can report issues too.

We'd be happy to see many forks and pull-requests to make this addon even better.

Maintainers are `Jens Klein <mailto:jk@kleinundpartner.at>` and the BlueDynamics Alliance developer team.
We appreciate any contribution and if a release is needed to be done on PyPI, please just contact one of us.
We also offer commercial support if any training, coaching, integration or adaptions are needed.



## License

The project is licensed under the GPLv2.

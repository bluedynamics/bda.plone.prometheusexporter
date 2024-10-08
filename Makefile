##############################################################################
# THIS FILE IS GENERATED BY MXMAKE
#
# DOMAINS:
#: applications.cookiecutter
#: applications.plone
#: applications.zope
#: core.base
#: core.mxenv
#: core.mxfiles
#: core.packages
#: qa.black
#: qa.coverage
#: qa.isort
#: qa.mypy
#: qa.pyupgrade
#: qa.test
#: qa.zpretty
#
# SETTINGS (ALL CHANGES MADE BELOW SETTINGS WILL BE LOST)
##############################################################################

## core.base

# `deploy` target dependencies.
# No default value.
DEPLOY_TARGETS?=

# target to be executed when calling `make run`
# No default value.
RUN_TARGET?=

# Additional files and folders to remove when running clean target
# No default value.
CLEAN_FS?=

# Optional makefile to include before default targets. This can
# be used to provide custom targets or hook up to existing targets.
# Default: include.mk
INCLUDE_MAKEFILE?=include.mk

# Optional additional directories to be added to PATH in format
# `/path/to/dir/:/path/to/other/dir`. Gets inserted first, thus gets searched
# first.
# No default value.
EXTRA_PATH?=

## core.mxenv

# Primary Python interpreter to use. It is used to create the
# virtual environment if `VENV_ENABLED` and `VENV_CREATE` are set to `true`.
# Default: python3
PRIMARY_PYTHON?=python3

# Minimum required Python version.
# Default: 3.9
PYTHON_MIN_VERSION?=3.11

# Install packages using the given package installer method.
# Supported are `pip` and `uv`. If uv is used, its global availability is
# checked. Otherwise, it is installed, either in the virtual environment or
# using the `PRIMARY_PYTHON`, dependent on the `VENV_ENABLED` setting. If
# `VENV_ENABLED` and uv is selected, uv is used to create the virtual
# environment.
# Default: pip
PYTHON_PACKAGE_INSTALLER?=uv

# Flag whether to use a global installed 'uv' or install
# it in the virtual environment.
# Default: false
MXENV_UV_GLOBAL?=false

# Flag whether to use virtual environment. If `false`, the
# interpreter according to `PRIMARY_PYTHON` found in `PATH` is used.
# Default: true
VENV_ENABLED?=true

# Flag whether to create a virtual environment. If set to `false`
# and `VENV_ENABLED` is `true`, `VENV_FOLDER` is expected to point to an
# existing virtual environment.
# Default: true
VENV_CREATE?=true

# The folder of the virtual environment.
# If `VENV_ENABLED` is `true` and `VENV_CREATE` is true it is used as the
# target folder for the virtual environment. If `VENV_ENABLED` is `true` and
# `VENV_CREATE` is false it is expected to point to an existing virtual
# environment. If `VENV_ENABLED` is `false` it is ignored.
# Default: .venv
VENV_FOLDER?=.venv

# mxdev to install in virtual environment.
# Default: mxdev
MXDEV?=mxdev

# mxmake to install in virtual environment.
# Default: mxmake
MXMAKE?=mxmake

## qa.zpretty

# Source folder to scan for XML and ZCML files.
# Default: src
ZPRETTY_SRC?=src

## qa.pyupgrade

# Source folder to scan for XML and ZCML files.
# Default: src
PYUPGRADE_SRC?=src

# Additional parameters for pyupgrade, see https://github.com/asottile/pyupgrade for details.
# Default: --py38-plus
PYUPGRADE_PARAMETERS?=--py38-plus

## qa.isort

# Source folder to scan for Python files to run isort on.
# Default: src
ISORT_SRC?=src

## qa.black

# Source folder to scan for Python files to run black on.
# Default: src
BLACK_SRC?=src tests

## core.mxfiles

# The config file to use.
# Default: mx.ini
PROJECT_CONFIG?=mx.ini

## core.packages

# Allow prerelease and development versions.
# By default, the package installer only finds stable versions.
# Default: false
PACKAGES_ALLOW_PRERELEASES?=false

## qa.test

# The command which gets executed. Defaults to the location the
# :ref:`run-tests` template gets rendered to if configured.
# Default: .mxmake/files/run-tests.sh
TEST_COMMAND?=.mxmake/files/run-tests.sh

# Additional Python requirements for running tests to be
# installed (via pip).
# Default: pytest
TEST_REQUIREMENTS?=pytest

# Additional make targets the test target depends on.
# No default value.
TEST_DEPENDENCY_TARGETS?=

## qa.coverage

# The command which gets executed. Defaults to the location the
# :ref:`run-coverage` template gets rendered to if configured.
# Default: .mxmake/files/run-coverage.sh
COVERAGE_COMMAND?=.mxmake/files/run-coverage.sh

## qa.mypy

# Source folder for code analysis.
# Default: src
MYPY_SRC?=src

# Mypy Python requirements to be installed (via pip).
# Default: types-setuptools
MYPY_REQUIREMENTS?=types-setuptools

## applications.zope

# cookiecutter configuration file to use
# Default: instance.yaml
ZOPE_CONFIGURATION_FILE?=instance.yaml

# cookiecutter configuration file to use
# Default: https://github.com/plone/cookiecutter-zope-instance
ZOPE_TEMPLATE?=https://github.com/plone/cookiecutter-zope-instance

# cookiecutter branch, tag or commit to checkout from the ZOPE_TEMPLATE. If empty, `--checkout` is not passed to cookiecutter.
# Default: main
ZOPE_TEMPLATE_CHECKOUT?=main

# The Zope folder "instance" will be generated relative to this existing folder.
# Default: .
ZOPE_BASE_FOLDER?=.

# script to run
# Default: No Default
ZOPE_SCRIPTNAME?=No Default

## applications.plone

# Path to the script to create or purge a Plone site
# Default: .mxmake/files/plone-site.py
PLONE_SITE_SCRIPT?=.mxmake/files/plone-site.py

# Exit with an error if the Plone site already exists
# Default: True
PLONE_SITE_CREATE_FAIL_IF_EXISTS?=True

# Exit with an error if the Plone site does not exists
# Default: True
PLONE_SITE_PURGE_FAIL_IF_NOT_EXISTS?=True

##############################################################################
# END SETTINGS - DO NOT EDIT BELOW THIS LINE
##############################################################################

INSTALL_TARGETS?=
DIRTY_TARGETS?=
CLEAN_TARGETS?=
PURGE_TARGETS?=
CHECK_TARGETS?=
TYPECHECK_TARGETS?=
FORMAT_TARGETS?=

export PATH:=$(if $(EXTRA_PATH),$(EXTRA_PATH):,)$(PATH)

# Defensive settings for make: https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
# for Makefile debugging purposes add -x to the .SHELLFLAGS
.SHELLFLAGS:=-eu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

# mxmake folder
MXMAKE_FOLDER?=.mxmake

# Sentinel files
SENTINEL_FOLDER?=$(MXMAKE_FOLDER)/sentinels
SENTINEL?=$(SENTINEL_FOLDER)/about.txt
$(SENTINEL): $(firstword $(MAKEFILE_LIST))
	@mkdir -p $(SENTINEL_FOLDER)
	@echo "Sentinels for the Makefile process." > $(SENTINEL)

##############################################################################
# mxenv
##############################################################################

export OS:=$(OS)

# Determine the executable path
ifeq ("$(VENV_ENABLED)", "true")
export VIRTUAL_ENV=$(abspath $(VENV_FOLDER))
ifeq ("$(OS)", "Windows_NT")
VENV_EXECUTABLE_FOLDER=$(VIRTUAL_ENV)/Scripts
else
VENV_EXECUTABLE_FOLDER=$(VIRTUAL_ENV)/bin
endif
export PATH:=$(VENV_EXECUTABLE_FOLDER):$(PATH)
MXENV_PYTHON=python
else
MXENV_PYTHON=$(PRIMARY_PYTHON)
endif

# Determine the package installer
ifeq ("$(PYTHON_PACKAGE_INSTALLER)","uv")
PYTHON_PACKAGE_COMMAND=uv pip
else
PYTHON_PACKAGE_COMMAND=$(MXENV_PYTHON) -m pip
endif

MXENV_TARGET:=$(SENTINEL_FOLDER)/mxenv.sentinel
$(MXENV_TARGET): $(SENTINEL)
	@$(PRIMARY_PYTHON) -c "import sys; vi = sys.version_info; sys.exit(1 if (int(vi[0]), int(vi[1])) >= tuple(map(int, '$(PYTHON_MIN_VERSION)'.split('.'))) else 0)" \
		&& echo "Need Python >= $(PYTHON_MIN_VERSION)" && exit 1 || :
	@[[ "$(VENV_ENABLED)" == "true" && "$(VENV_FOLDER)" == "" ]] \
		&& echo "VENV_FOLDER must be configured if VENV_ENABLED is true" && exit 1 || :
	@[[ "$(VENV_ENABLED)$(PYTHON_PACKAGE_INSTALLER)" == "falseuv" ]] \
		&& echo "Package installer uv does not work with a global Python interpreter." && exit 1 || :
ifeq ("$(VENV_ENABLED)", "true")
ifeq ("$(VENV_CREATE)", "true")
ifeq ("$(PYTHON_PACKAGE_INSTALLER)$(MXENV_UV_GLOBAL)","uvtrue")
	@echo "Setup Python Virtual Environment using package 'uv' at '$(VENV_FOLDER)'"
	@uv venv -p $(PRIMARY_PYTHON) --seed $(VENV_FOLDER)
else
	@echo "Setup Python Virtual Environment using module 'venv' at '$(VENV_FOLDER)'"
	@$(PRIMARY_PYTHON) -m venv $(VENV_FOLDER)
	@$(MXENV_PYTHON) -m ensurepip -U
endif
endif
else
	@echo "Using system Python interpreter"
endif
ifeq ("$(PYTHON_PACKAGE_INSTALLER)$(MXENV_UV_GLOBAL)","uvfalse")
	@echo "Install uv"
	@$(MXENV_PYTHON) -m pip install uv
endif
	@$(PYTHON_PACKAGE_COMMAND) install -U pip setuptools wheel
	@echo "Install/Update MXStack Python packages"
	@$(PYTHON_PACKAGE_COMMAND) install -U $(MXDEV) $(MXMAKE)
	@touch $(MXENV_TARGET)

.PHONY: mxenv
mxenv: $(MXENV_TARGET)

.PHONY: mxenv-dirty
mxenv-dirty:
	@rm -f $(MXENV_TARGET)

.PHONY: mxenv-clean
mxenv-clean: mxenv-dirty
ifeq ("$(VENV_ENABLED)", "true")
ifeq ("$(VENV_CREATE)", "true")
	@rm -rf $(VENV_FOLDER)
endif
else
	@$(PYTHON_PACKAGE_COMMAND) uninstall -y $(MXDEV)
	@$(PYTHON_PACKAGE_COMMAND) uninstall -y $(MXMAKE)
endif

INSTALL_TARGETS+=mxenv
DIRTY_TARGETS+=mxenv-dirty
CLEAN_TARGETS+=mxenv-clean

##############################################################################
# zpretty
##############################################################################

ZPRETTY_TARGET:=$(SENTINEL_FOLDER)/zpretty.sentinel
$(ZPRETTY_TARGET): $(MXENV_TARGET)
	@echo "Install zpretty"
	@$(PYTHON_PACKAGE_COMMAND) install zpretty
	@touch $(ZPRETTY_TARGET)

.PHONY: zpretty-check
zpretty-check: $(ZPRETTY_TARGET)
	@echo "Run zpretty check in: $(ZPRETTY_SRC)"
	@find $(ZPRETTY_SRC) -name '*.zcml' -or -name '*.xml' -exec zpretty --check {} +

.PHONY: zpretty-format
zpretty-format: $(ZPRETTY_TARGET)
	@echo "Run zpretty format in: $(ZPRETTY_SRC)"
	@find $(ZPRETTY_SRC) -name '*.zcml' -or -name '*.xml' -exec zpretty -i {} +

.PHONY: zpretty-dirty
zpretty-dirty:
	@rm -f $(ZPRETTY_TARGET)

.PHONY: zpretty-clean
zpretty-clean: zpretty-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y zpretty || :

INSTALL_TARGETS+=$(ZPRETTY_TARGET)
CHECK_TARGETS+=zpretty-check
FORMAT_TARGETS+=zpretty-format
DIRTY_TARGETS+=zpretty-dirty
CLEAN_TARGETS+=zpretty-clean

##############################################################################
# pyupgrade
##############################################################################

PYUPGRADE_TARGET:=$(SENTINEL_FOLDER)/pyupgrade.sentinel
$(PYUPGRADE_TARGET): $(MXENV_TARGET)
	@echo "Install pyupgrade"
	@$(PYTHON_PACKAGE_COMMAND) install pyupgrade
	@touch $(PYUPGRADE_TARGET)

.PHONY: pyupgrade-format
pyupgrade-format: $(PYUPGRADE_TARGET)
	@echo "Run pyupgrade format in: $(PYUPGRADE_SRC)"
	@find $(PYUPGRADE_SRC) -name '*.py' -exec pyupgrade $(PYUPGRADE_PARAMETERS) {} +

.PHONY: pyupgrade-dirty
pyupgrade-dirty:
	@rm -f $(PYUPGRADE_TARGET)

.PHONY: pyupgrade-clean
pyupgrade-clean: pyupgrade-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y pyupgrade || :

INSTALL_TARGETS+=$(PYUPGRADE_TARGET)
FORMAT_TARGETS+=pyupgrade-format
DIRTY_TARGETS+=pyupgrade-dirty
CLEAN_TARGETS+=pyupgrade-clean

##############################################################################
# isort
##############################################################################

ISORT_TARGET:=$(SENTINEL_FOLDER)/isort.sentinel
$(ISORT_TARGET): $(MXENV_TARGET)
	@echo "Install isort"
	@$(PYTHON_PACKAGE_COMMAND) install isort
	@touch $(ISORT_TARGET)

.PHONY: isort-check
isort-check: $(ISORT_TARGET)
	@echo "Run isort check"
	@isort --check $(ISORT_SRC)

.PHONY: isort-format
isort-format: $(ISORT_TARGET)
	@echo "Run isort format"
	@isort $(ISORT_SRC)

.PHONY: isort-dirty
isort-dirty:
	@rm -f $(ISORT_TARGET)

.PHONY: isort-clean
isort-clean: isort-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y isort || :

INSTALL_TARGETS+=$(ISORT_TARGET)
CHECK_TARGETS+=isort-check
FORMAT_TARGETS+=isort-format
DIRTY_TARGETS+=isort-dirty
CLEAN_TARGETS+=isort-clean

##############################################################################
# black
##############################################################################

BLACK_TARGET:=$(SENTINEL_FOLDER)/black.sentinel
$(BLACK_TARGET): $(MXENV_TARGET)
	@echo "Install Black"
	@$(PYTHON_PACKAGE_COMMAND) install black
	@touch $(BLACK_TARGET)

.PHONY: black-check
black-check: $(BLACK_TARGET)
	@echo "Run black checks"
	@black --check $(BLACK_SRC)

.PHONY: black-format
black-format: $(BLACK_TARGET)
	@echo "Run black format"
	@black $(BLACK_SRC)

.PHONY: black-dirty
black-dirty:
	@rm -f $(BLACK_TARGET)

.PHONY: black-clean
black-clean: black-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y black || :

INSTALL_TARGETS+=$(BLACK_TARGET)
CHECK_TARGETS+=black-check
FORMAT_TARGETS+=black-format
DIRTY_TARGETS+=black-dirty
CLEAN_TARGETS+=black-clean

##############################################################################
# mxfiles
##############################################################################

# case `core.sources` domain not included
SOURCES_TARGET?=

# File generation target
MXMAKE_FILES?=$(MXMAKE_FOLDER)/files

# set environment variables for mxmake
define set_mxfiles_env
	@export MXMAKE_FILES=$(1)
endef

# unset environment variables for mxmake
define unset_mxfiles_env
	@unset MXMAKE_FILES
endef

$(PROJECT_CONFIG):
ifneq ("$(wildcard $(PROJECT_CONFIG))","")
	@touch $(PROJECT_CONFIG)
else
	@echo "[settings]" > $(PROJECT_CONFIG)
endif

LOCAL_PACKAGE_FILES:=$(wildcard pyproject.toml setup.cfg setup.py requirements.txt constraints.txt)

FILES_TARGET:=requirements-mxdev.txt
$(FILES_TARGET): $(PROJECT_CONFIG) $(MXENV_TARGET) $(SOURCES_TARGET) $(LOCAL_PACKAGE_FILES)
	@echo "Create project files"
	@mkdir -p $(MXMAKE_FILES)
	$(call set_mxfiles_env,$(MXMAKE_FILES))
	@mxdev -n -c $(PROJECT_CONFIG)
	$(call unset_mxfiles_env)
	@test -e $(MXMAKE_FILES)/pip.conf && cp $(MXMAKE_FILES)/pip.conf $(VENV_FOLDER)/pip.conf || :
	@touch $(FILES_TARGET)

.PHONY: mxfiles
mxfiles: $(FILES_TARGET)

.PHONY: mxfiles-dirty
mxfiles-dirty:
	@touch $(PROJECT_CONFIG)

.PHONY: mxfiles-clean
mxfiles-clean: mxfiles-dirty
	@rm -rf constraints-mxdev.txt requirements-mxdev.txt $(MXMAKE_FILES)

INSTALL_TARGETS+=mxfiles
DIRTY_TARGETS+=mxfiles-dirty
CLEAN_TARGETS+=mxfiles-clean

##############################################################################
# packages
##############################################################################

# additional sources targets which requires package re-install on change
-include $(MXMAKE_FILES)/additional_sources_targets.mk
ADDITIONAL_SOURCES_TARGETS?=

INSTALLED_PACKAGES=$(MXMAKE_FILES)/installed.txt

ifeq ("$(PACKAGES_ALLOW_PRERELEASES)","true")
ifeq ("$(PYTHON_PACKAGE_INSTALLER)","uv")
PACKAGES_PRERELEASES=--prerelease=allow
else
PACKAGES_PRERELEASES=--pre
endif
else
PACKAGES_PRERELEASES=
endif

PACKAGES_TARGET:=$(INSTALLED_PACKAGES)
$(PACKAGES_TARGET): $(FILES_TARGET) $(ADDITIONAL_SOURCES_TARGETS)
	@echo "Install python packages"
	@$(PYTHON_PACKAGE_COMMAND) install $(PACKAGES_PRERELEASES) -r $(FILES_TARGET)
	@$(PYTHON_PACKAGE_COMMAND) freeze > $(INSTALLED_PACKAGES)
	@touch $(PACKAGES_TARGET)

.PHONY: packages
packages: $(PACKAGES_TARGET)

.PHONY: packages-dirty
packages-dirty:
	@rm -f $(PACKAGES_TARGET)

.PHONY: packages-clean
packages-clean:
	@test -e $(FILES_TARGET) \
		&& test -e $(MXENV_PYTHON) \
		&& $(MXENV_PYTHON) -m pip uninstall -y -r $(FILES_TARGET) \
		|| :
	@rm -f $(PACKAGES_TARGET)

INSTALL_TARGETS+=packages
DIRTY_TARGETS+=packages-dirty
CLEAN_TARGETS+=packages-clean

##############################################################################
# test
##############################################################################

TEST_TARGET:=$(SENTINEL_FOLDER)/test.sentinel
$(TEST_TARGET): $(MXENV_TARGET)
	@echo "Install $(TEST_REQUIREMENTS)"
	@$(PYTHON_PACKAGE_COMMAND) install $(TEST_REQUIREMENTS)
	@touch $(TEST_TARGET)

.PHONY: test
test: $(FILES_TARGET) $(SOURCES_TARGET) $(PACKAGES_TARGET) $(TEST_TARGET) $(TEST_DEPENDENCY_TARGETS)
	@test -z "$(TEST_COMMAND)" && echo "No test command defined" && exit 1 || :
	@echo "Run tests using $(TEST_COMMAND)"
	@/usr/bin/env bash -c "$(TEST_COMMAND)"

.PHONY: test-dirty
test-dirty:
	@rm -f $(TEST_TARGET)

.PHONY: test-clean
test-clean: test-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y $(TEST_REQUIREMENTS) || :
	@rm -rf .pytest_cache

INSTALL_TARGETS+=$(TEST_TARGET)
CLEAN_TARGETS+=test-clean
DIRTY_TARGETS+=test-dirty

##############################################################################
# coverage
##############################################################################

COVERAGE_TARGET:=$(SENTINEL_FOLDER)/coverage.sentinel
$(COVERAGE_TARGET): $(TEST_TARGET)
	@echo "Install Coverage"
	@$(PYTHON_PACKAGE_COMMAND) install -U coverage
	@touch $(COVERAGE_TARGET)

.PHONY: coverage
coverage: $(FILES_TARGET) $(SOURCES_TARGET) $(PACKAGES_TARGET) $(COVERAGE_TARGET)
	@test -z "$(COVERAGE_COMMAND)" && echo "No coverage command defined" && exit 1 || :
	@echo "Run coverage using $(COVERAGE_COMMAND)"
	@/usr/bin/env bash -c "$(COVERAGE_COMMAND)"

.PHONY: coverage-dirty
coverage-dirty:
	@rm -f $(COVERAGE_TARGET)

.PHONY: coverage-clean
coverage-clean: coverage-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y coverage || :
	@rm -rf .coverage htmlcov

INSTALL_TARGETS+=$(COVERAGE_TARGET)
DIRTY_TARGETS+=coverage-dirty
CLEAN_TARGETS+=coverage-clean

##############################################################################
# mypy
##############################################################################

MYPY_TARGET:=$(SENTINEL_FOLDER)/mypy.sentinel
$(MYPY_TARGET): $(MXENV_TARGET)
	@echo "Install mypy"
	@$(PYTHON_PACKAGE_COMMAND) install mypy $(MYPY_REQUIREMENTS)
	@touch $(MYPY_TARGET)

.PHONY: mypy
mypy: $(PACKAGES_TARGET) $(MYPY_TARGET)
	@echo "Run mypy"
	@mypy $(MYPY_SRC)

.PHONY: mypy-dirty
mypy-dirty:
	@rm -f $(MYPY_TARGET)

.PHONY: mypy-clean
mypy-clean: mypy-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y mypy || :
	@rm -rf .mypy_cache

INSTALL_TARGETS+=$(MYPY_TARGET)
TYPECHECK_TARGETS+=mypy
CLEAN_TARGETS+=mypy-clean
DIRTY_TARGETS+=mypy-dirty

##############################################################################
# cookiecutter
##############################################################################

COOKIECUTTER_TARGET:=$(SENTINEL_FOLDER)/cookiecutter.sentinel
$(COOKIECUTTER_TARGET): $(MXENV_TARGET)
	@echo "Install cookiecutter"
	@$(PYTHON_PACKAGE_COMMAND) install "cookiecutter>=2.6.0"
	@touch $(COOKIECUTTER_TARGET)

.PHONY: cookiecutter
cookiecutter: $(COOKIECUTTER_TARGET)

.PHONY: cookiecutter-dirty
cookiecutter-dirty:
	@rm -f $(COOKIECUTTER_TARGET)

.PHONY: cookiecutter-clean
cookiecutter-clean: cookiecutter-dirty
	@test -e $(MXENV_PYTHON) && $(MXENV_PYTHON) -m pip uninstall -y cookiecutter || :
	@rm -f $(COOKIECUTTER_TARGET)

DIRTY_TARGETS+=cookiecutter-dirty
CLEAN_TARGETS+=cookiecutter-clean

##############################################################################
# zope
##############################################################################

ZOPE_INSTANCE_FOLDER:=$(ZOPE_BASE_FOLDER)/instance
ZOPE_INSTANCE_TARGET:=$(ZOPE_INSTANCE_FOLDER)/etc/zope.ini $(ZOPE_INSTANCE_FOLDER)/etc/zope.conf $(ZOPE_INSTANCE_FOLDER)/etc/site.zcml
ZOPE_RUN_TARGET:=$(ZOPE_INSTANCE_TARGET) $(PACKAGES_TARGET)

ifeq (,$(ZOPE_TEMPLATE_CHECKOUT))
	ZOPE_COOKIECUTTER_TEMPLATE_OPTIONS=
else
	ZOPE_COOKIECUTTER_TEMPLATE_OPTIONS=--checkout $(ZOPE_TEMPLATE_CHECKOUT)
endif

${ZOPE_CONFIGURATION_FILE}:
	@touch ${ZOPE_CONFIGURATION_FILE}

$(ZOPE_INSTANCE_TARGET): $(COOKIECUTTER_TARGET) $(ZOPE_CONFIGURATION_FILE)
	@echo Create Plone/Zope configuration from $(ZOPE_TEMPLATE) to $(ZOPE_INSTANCE_FOLDER)
	@cookiecutter -f --no-input ${ZOPE_COOKIECUTTER_TEMPLATE_OPTIONS} --config-file $(ZOPE_CONFIGURATION_FILE) --output-dir $(ZOPE_BASE_FOLDER) $(ZOPE_TEMPLATE)

.PHONY: zope-instance
zope-instance: $(ZOPE_INSTANCE_TARGET) $(SOURCES)

.PHONY: zope-start
zope-start: $(ZOPE_RUN_TARGET)
	@echo "Start Zope/Plone with configuration in $(ZOPE_INSTANCE_FOLDER)"
	@runwsgi -v "$(ZOPE_INSTANCE_FOLDER)/etc/zope.ini"

.PHONY: zope-debug
zope-debug: $(ZOPE_RUN_TARGET)
	@echo "Start Zope/Plone with configuration in $(ZOPE_INSTANCE_FOLDER)"
	@zconsole debug "$(ZOPE_INSTANCE_FOLDER)/etc/zope.ini"

.PHONY: zope-runscript
zope-runscript: $(ZOPE_RUN_TARGET)
	@echo "Run Zope/Plone Console Script $(ZOPE_SCRIPTNAME) in $(ZOPE_INSTANCE_FOLDER)"
	@zconsole run "$(ZOPE_INSTANCE_FOLDER)/etc/zope.ini" $(ZOPE_SCRIPTNAME)

.PHONY: zope-dirty
zope-dirty:
	@touch ${ZOPE_CONFIGURATION_FILE}

.PHONY: zope-clean
zope-clean:
	@touch ${ZOPE_CONFIGURATION_FILE}
	@rm -rf $(ZOPE_INSTANCE_FOLDER)/etc $(ZOPE_INSTANCE_FOLDER)/inituser

.PHONY: zope-purge
zope-purge: zope-dirty
	@rm -rf $(ZOPE_INSTANCE_FOLDER)

INSTALL_TARGETS+=zope-instance
DIRTY_TARGETS+=zope-dirty
CLEAN_TARGETS+=zope-clean

##############################################################################
# plone
##############################################################################

.PHONY: plone-site-create
plone-site-create: $(ZOPE_RUN_TARGET)
	@echo "Creating Plone Site"
	@export PLONE_SITE_PURGE=False
	@export PLONE_SITE_CREATE=True
	@zconsole run $(ZOPE_INSTANCE_FOLDER)/etc/zope.conf $(PLONE_SITE_SCRIPT)

.PHONY: plone-site-purge
plone-site-purge: $(ZOPE_RUN_TARGET)
	@echo "Purging Plone Site"
	@export PLONE_SITE_PURGE=True
	@export PLONE_SITE_CREATE=False
	@zconsole run $(ZOPE_INSTANCE_FOLDER)/etc/zope.conf $(PLONE_SITE_SCRIPT)

.PHONY: plone-site-recreate
plone-site-recreate: $(ZOPE_RUN_TARGET)
	@echo "Purging Plone Site"
	@export PLONE_SITE_PURGE=True
	@export PLONE_SITE_CREATE=True
	@zconsole run $(ZOPE_INSTANCE_FOLDER)/etc/zope.conf $(PLONE_SITE_SCRIPT)

-include $(INCLUDE_MAKEFILE)

##############################################################################
# Default targets
##############################################################################

INSTALL_TARGET:=$(SENTINEL_FOLDER)/install.sentinel
$(INSTALL_TARGET): $(INSTALL_TARGETS)
	@touch $(INSTALL_TARGET)

.PHONY: install
install: $(INSTALL_TARGET)
	@touch $(INSTALL_TARGET)

.PHONY: run
run: $(RUN_TARGET)

.PHONY: deploy
deploy: $(DEPLOY_TARGETS)

.PHONY: dirty
dirty: $(DIRTY_TARGETS)
	@rm -f $(INSTALL_TARGET)

.PHONY: clean
clean: dirty $(CLEAN_TARGETS)
	@rm -rf $(CLEAN_TARGETS) $(MXMAKE_FOLDER) $(CLEAN_FS)

.PHONY: purge
purge: clean $(PURGE_TARGETS)

.PHONY: runtime-clean
runtime-clean:
	@echo "Remove runtime artifacts, like byte-code and caches."
	@find . -name '*.py[c|o]' -delete
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -fr {} +

.PHONY: check
check: $(CHECK_TARGETS)

.PHONY: typecheck
typecheck: $(TYPECHECK_TARGETS)

.PHONY: format
format: $(FORMAT_TARGETS)

# 		nix-data-mesh
#		~~~~~~~~~~~~~~~
# 		Makefile for building ``nix-data-mesh`` infrastructure, services and domains.

.PHONY: help setup pyenv shell python python_recopy

help:
	@echo "\
	\n +-------------------------------------+ \
	\n |            Nix Data Mesh            | \
	\n |              Commands               | \
	\n +-------------------------------------+ \
	\n setup: build local environment          \
	\n shell: start Nix bash shell             \
	\n pyenv: install Python globally          \
	\n python: create new Python project       \
	\n python_recopy: update Python project    \
	"

PYTHON_VERSION := 3.11.9
MESH_HOME := ~/repos


setup: pyenv shell
	echo 'building nix-data-mesh platform ... '


shell:
	echo 'starting Nix bash shell ...'
	nix-shell --pure


pyenv:
	@if ! pyenv versions --bare | grep -qx "$(PYTHON_VERSION)"; then \
		echo 'Installing Python $(PYTHON_VERSION)...'; \
		pyenv install $(PYTHON_VERSION); \
	else \
		echo 'Python $(PYTHON_VERSION) already installed.'; \
	fi; \
	echo 'Setting global Python version to $(PYTHON_VERSION)...'; \
	pyenv global $(PYTHON_VERSION)


# TODO: Add template parameter: project_version.
project_name = default_project_name
python:
	echo 'initializing Python project using template ... '
	copier copy $(MESH_HOME)/nix-data-mesh/templates/python/ $(MESH_HOME)/$(project_name)
	git -C $(MESH_HOME)/$(project_name) init
	echo 'Done! cd into $(MESH_HOME)/$(project_name) to get started!'


.PHONY: python_recopy
python_recopy:
	echo 'applying template updates to existing Python project ... '
	(cd $(MESH_HOME)/$(project_name); copier recopy)

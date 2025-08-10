.PHONY: help setup pyenv shell python python_recopy

DESCRIPTION = A build system for modern data platforms.
PYTHON_VERSION := 3.11.9
MESH_HOME := ~/repos

help:  ## List all commands.
	@awk 'BEGIN {FS=":.*##"; \
		print "Usage: make <command> [arg=<val>]\n\n$(DESCRIPTION)\n\nCommand List:"} \
		/^[[:alnum:]_%.-]+:.*##/ {printf "  %-24s %s\n", $$1, $$2}' \
		$(MAKEFILE_LIST)


setup: pyenv shell  ## Build local environment.
	echo 'building nix-data-mesh platform ... '


shell:  ## Start local Nix bash shell.
	echo 'starting Nix bash shell ...'
	nix-shell --pure


pyenv:  ## Install Python globally using Pyenv.
	@if ! pyenv versions --bare | grep -qx "$(PYTHON_VERSION)"; then \
		echo 'Installing Python $(PYTHON_VERSION)...'; \
		pyenv install $(PYTHON_VERSION); \
	else \
		echo 'Python $(PYTHON_VERSION) already installed.'; \
	fi; \
	echo 'Setting global Python version to $(PYTHON_VERSION)...'; \
	pyenv global $(PYTHON_VERSION)


project_name = default_project_name
python:  ## [TEMPLATE] State-of-the-art Python project template.
	echo 'initializing Python project using template ... '
	copier copy $(MESH_HOME)/nix-data-mesh/templates/python/ $(MESH_HOME)/$(project_name)
	git -C $(MESH_HOME)/$(project_name) init
	echo 'Done! Exit shell & cd into $(MESH_HOME)/$(project_name) to get started!'


.PHONY: python_recopy
python_recopy:  ## [TEMPLATE] Apply updates to existing Python project.
	echo 'applying template updates to existing Python project ... '
	(cd $(MESH_HOME)/$(project_name); copier recopy)

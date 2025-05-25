# 		nix-data-mesh
#		~~~~~~~~~~~~~~~
# 		Makefile for building ``nix-data-mesh`` infrastructure, services and domains.

.PHONY: help setup shell

help:
	@echo "\
	\n +-------------------------------------+ \
	\n |            Nix Data Mesh            | \
	\n |              Commands               | \
	\n +-------------------------------------+ \
	\n setup: build macOS workspace            \
	\n shell: starting Nix bash shell          \
	\n docs: build MKDocs site locally         \
	\n                                         \
	"

PYTHON_VERSION := 3.11.9

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

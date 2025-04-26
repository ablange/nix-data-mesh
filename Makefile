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

setup: shell
	echo 'building nix-data-mesh platform ... '

shell:
	echo 'starting Nix bash shell ...'
	cp -rf shell/bash/.bashrc ~/.bashrc
	cp -rf shell/bash/.bash_aliases ~/.bash_aliases
	cp -rf shell/bash/.bash_profile ~/.bash_profile
	nix-shell --pure

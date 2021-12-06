export HUGO_VERSION?=0.89.4
export HUGO_PLATFORM?=Linux-64bit

export ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := build

build:
	scripts/build.sh

serve:
	scripts/serve.sh

publish:
	scripts/publish.sh

gen-command-docs:
	scripts/gen_cli_docs.sh

# Makefile
# Author: Huan LI <zixia@zixia.net> git.io/zixia
SOURCE_GLOB=$(wildcard docs/*.md)

.PHONY: all
all: build

.PHONY: clean
clean:
	rm -fr dist/

.PHONY: lint
lint: mdlint

.PHONY: mdlint
pylint:
	mdlint $(SOURCE_GLOB)

.PHONY: test
test: lint
	echo "test"
	# false
	echo "ok"

dist/paper.pdf: paper/text.md
	./scripts/build.sh pdf

dist/paper.html: paper/text.md
	./scripts/build.sh html

build: dist/paper.pdf

# Makefile
# Author: Huan LI <zixia@zixia.net> git.io/zixia
SOURCE_GLOB=$(wildcard paper/* images/*)

.PHONY: all
all: build

.PHONY: clean
clean:
	rm -fr dist/

.PHONY: mdlint
mdlint:
	mdlint $(SOURCE_GLOB)

.PHONY: test
test:
	echo "test"
	# false
	echo "ok"

.PHONY: pdf
pdf: dist/paper.pdf
dist/paper.pdf: $(SOURCE_GLOB)
	./scripts/build.sh pdf

.PHONY: html
html: dist/paper.html
dist/paper.html: $(SOURCE_GLOB)
	./scripts/build.sh html

.PHONY: build
build: pdf html

.PHONY: watch
watch:
	nodemon --watch paper/ --ext '*' --exec 'make pdf'

# Makefile
# Author: Huan LI <zixia@zixia.net> git.io/zixia
SOURCE_GLOB=$(wildcard paper/* images/* scripts/*)

.PHONY: all
all: build

.PHONY: clean
clean:
	rm -fr dist/
	rm -fr tex2pdf.*/

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

.PHONY: tex
tex: dist/paper.tex
dist/paper.tex: $(SOURCE_GLOB)
	./scripts/build.sh tex

.PHONY: build
build: pdf html

.PHONY: watch
watch:
	nodemon --watch paper/ --ext '*' --exec 'make pdf'

.PHONY: install
install:
	ln -sf ../images paper/images

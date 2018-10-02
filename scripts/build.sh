#!/usr/bin/env bash
set -e

[ -z "$1" ] && {
  echo 'Usage: build.sh <docx | html | pdf | tex>'
  exit 1
}

[ -d dist/ ] || mkdir dist

pandoc \
  --pdf-engine=xelatex \
  --filter=pandoc-citeproc \
  --bibliography=paper/citations.bib \
  --variable=classoption:twocolumn \
  --variable=papersize:a4paper \
  -H latex/longtable-redefined-with-two-columns.tex \
  -s paper/text.md \
  -o dist/paper.$1

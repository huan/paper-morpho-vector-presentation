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
  \
  --variable=classoption:twocolumn \
  --variable=papersize:a4paper \
  \
  --bibliography=paper/citations.bib \
  --metadata-file=paper/metadata.yaml \
  \
  -H latex/longtable-redefined-with-two-columns.tex \
  \
  -s paper/text.md \
  -o dist/paper.$1

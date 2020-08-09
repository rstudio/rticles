#!/usr/bin/env sh

cd $(dirname "$0")/../demo

for tdir in ../inst/rmarkdown/templates/*; do
  tpl="$(basename "$tdir")"

  echo "::group::${tpl}"

  if [ -d _book ]; then
    rm -rf _book
  fi

  set +e
  Rscript -e 'bookdown::render_book("00-index.Rmd", bookdown::pdf_book(base_format='\''rticles::'"${tpl}"\''))'
  set -e

  if [ -d _book ]; then
    mv _book ../artifacts/_book_"${tpl}"
  fi

  echo "::endgroup::"
done

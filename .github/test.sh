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
  cd "${tdir}"/skeleton
  Rscript -e 'rmarkdown::render("skeleton.Rmd", "rticles::'"${tpl}"'")'
  cd -
  set -e

  if [ -d _book ]; then
    mkdir -p ../artifacts/"${tpl}"
    mv _book ../artifacts/"${tpl}"
  fi

  for ext in pdf tex; do
    if [ -f "${tdir}"/skeleton/skeleton."${ext}" ]; then
      mkdir -p ../artifacts/"${tpl}"
      mv "${tdir}"/skeleton/skeleton."${ext}" ../artifacts/"${tpl}"/
    fi
  done

  echo "::endgroup::"
done

To contribute a new article template to this package, please make sure you have done the following things (note that `journalname_article` below is only an example name):

- [ ] Unless you have done it in any other RStudio's projects before, please sign the [individual](https://rstudioblog.files.wordpress.com/2017/05/rstudio_individual_contributor_agreement.pdf) or [corporate](https://rstudioblog.files.wordpress.com/2017/05/rstudio_corporate_contributor_agreement.pdf) contributor agreement for a significant pull request (it is fine not to sign it if a PR is only intended to fix a few typos). You can send the signed copy to <jj@rstudio.com>.

- [ ] Add the `journalname_article()` function to `R/article.R` if the output format is simple enough, otherwise create a separate `R/journalname_article.R`.

- [ ] Add the Pandoc LaTeX template `inst/rmarkdown/templates/journalname_article/resources/template.tex`.

- [ ] Add a skeleton article `inst/rmarkdown/templates/journalname_article/skeleton/skeleton.Rmd`.

- [ ] Add a description of the template `inst/rmarkdown/templates/journalname_article/template.yaml`.

- [ ] Please include the document class file (`*.cls`) if needed, but please do not include standard LaTeX packages (`*.sty`) that can be downloaded from CTAN. Please keep the number of new files absolutely minimal, and also make examples minimal (e.g., if you need a `.bib` example, try to only leave one or two bibliography entries in it, and don't include one hundred items in it without using all of them).

- [ ] Update Rd and namespace (could be done by `devtools::document()`).

- [ ] Update NEWS.

- [ ] Update README with a link to the newly supported journal.

- [ ] Add a test to `tests/testit/test-formats.R`.

- [ ] Add your name to the list of authors `Authors@R` in DESCRIPTION. You don't need to bump the package version in DESCRIPTION.

Lastly, please try your best to do only one thing per pull request (e.g., if you want to add two output formats, do them in two separate pull requests), and refrain from making cosmetic changes in the code base: https://yihui.name/en/2018/02/bite-sized-pull-requests/

Thank you!

[![Travis-CI Build Status](https://travis-ci.org/rstudio/rticles.svg?branch=master)](https://travis-ci.org/rstudio/rticles)
[![Downloads from the RStudio CRAN mirror](https://cranlogs.r-pkg.org/badges/rticles)](https://cran.r-project.org/package=rticles)

## Installation

You can install and use **rticles** from CRAN as follows:

```r
install.packages("rticles")
```

If you wish to install the development version from GitHub (which often contains new article formats), you can do this:

```r
remotes::install_github("rstudio/rticles")
```

## Overview

The **rticles** package provides a suite of custom [R Markdown](http://rmarkdown.rstudio.com) LaTeX formats and templates for various formats, including:

- [ACM](http://www.acm.org/) articles

- [ACS](http://pubs.acs.org/) articles

- [AEA](https://www.aeaweb.org/journals/policies/templates) journal submissions (contributed by @sboysel)

- [AGU](https://sites.agu.org/) journal submissions (contributed by @eliocamp via #199)

- [AMS](https://www.ametsoc.org/) articles (contributed by @yufree)

- [arXiv](https://arxiv.org/) pre-prints based on George Kour's template (contributed by @alexpghayes via #236)

- [Biometrics](http://www.biometrics.tibs.org/) articles (contributed by @daltonhance via #170)

- [Bulletin de l'AMQ](https://www.amq.math.ca/bulletin/) journal submissions (contributed by @desautm via #145)

- [Copernicus Publications](https://publications.copernicus.org) journal submissions (contributed by @nuest via #172)

- [CTeX](https://ctan.org/pkg/ctex) documents

- [Elsevier](https://www.elsevier.com) journal submissions

- [IEEE Transaction](http://www.ieee.org/publications_standards/publications/authors/author_templates.html) journal submissions
- [Frontiers](https://www.frontiersin.org/) articles (contributed by @zkamvar)

- [JOSS](http://joss.theoj.org/) and [JOSE](https://jose.theoj.org/) articles (contributed by @noamross via #229)

- [JSS](http://www.jstatsoft.org/) articles

- [MDPI](http://www.mdpi.com) journal submissions (contributed by @dleutnant via #147)

- [Monthly Notices of the Royal Astronomical Society (MNRAS)](https://academic.oup.com/mnras) articles (contributed by @oleskiewicz via #175)

- [OUP](https://academic.oup.com/journals/pages/authors/preparing_your_manuscript) articles (contributed by @dmkaplan2000 via #271, #284)

- [PeerJ](https://peerj.com) articles (contributed by @zkamvar)

- [PLOS](http://journals.plos.org) journal submissions (contributed by @sjmgarnier)

- [Royal Society Open Science](http://rsos.royalsocietypublishing.org/) journal submissions (contributed by @ThierryO)

- [Royal Statistical Society](https://rss.org.uk/) journal submissions (contributed by @carlganz)

- [Sage](https://uk.sagepub.com/en-gb/eur/manuscript-submission-guidelines) journal submissions (contributed by @oguzhanogreden via #181)

- [Springer](https://www.springer.com/gp/livingreviews/latex-templates) journal submissions (contributed by @strakaps via #164)

- [Statistics in Medicine](http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1097-0258/homepage/la_tex_class_file.htm) journal submissions (contributed by @ellessenne via #231)

- [Taylor & Francis](https://www.tandfonline.com/) articles (contributed by @dleutnant via #218)

- [The R Journal](https://journal.r-project.org/) articles

Under the hood, LaTeX templates are used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax, and R code and its output can be seamlessly included using [knitr](https://yihui.name/knitr/).

Using **rticles** requires the prerequisites described below. You can get most of these automatically by installing the latest release of RStudio (instructions for using **rticles** without RStudio are also provided).

## Using rticles from RStudio

To use **rticles** from RStudio:

1. Install the latest [RStudio](http://www.rstudio.com/products/rstudio/download/).

2. Install the **rticles** package. 

3. Use the **New R Markdown** dialog to create an article from one of the templates:

    ![New R Markdown](https://rmarkdown.rstudio.com/images/new_r_markdown.png)

## Using rticles outside of RStudio

1. Install [pandoc](http://pandoc.org) using the [instructions for your platform](https://rmarkdown.rstudio.com/docs/articles/pandoc.html).

2. Install the **rticles** packages.

3. Use the `rmarkdown::draft()` function to create articles:

    ```r
    rmarkdown::draft("MyJSSArticle.Rmd", template = "jss_article", package = "rticles")
    rmarkdown::draft("MyRJournalArticle", template = "rjournal_article", package = "rticles")
    ```

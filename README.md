[![Travis-CI Build Status](https://travis-ci.org/rstudio/rticles.svg?branch=master)](https://travis-ci.org/rstudio/rticles)

## Installation

You can install and use **rticles** from CRAN as follows:

```r
install.packages("rticles")
```

If you wish to install the development version from GitHub (which often contains new article formats), you can do this:

```r
devtools::install_github("rstudio/rticles")
```

## Overview

The **rticles** package provides a suite of custom [R Markdown](http://rmarkdown.rstudio.com) LaTeX formats and templates for various formats, including:

- [ACM](http://www.acm.org/) articles

- [ACS](http://pubs.acs.org/) articles

- [AEA](https://www.aeaweb.org/journals/policies/templates) journal submissions

- [AMS](https://www.ametsoc.org/) articles

- [Biometrics](http://www.biometrics.tibs.org/) articles

- [Bulletin de l'AMQ](https://www.amq.math.ca/bulletin/) journal submissions

- [CTeX](http://ctex.org) documents

- [Elsevier](https://www.elsevier.com) journal submissions

- [IEEE Transaction](http://www.ieee.org/publications_standards/publications/authors/author_templates.html) journal submissions

- [JSS](http://www.jstatsoft.org/) articles

- [MDPI](http://www.mdpi.com) journal submissions

- [Monthly Notices of the Royal Astronomical Society](https://academic.oup.com/mnras) articles

- [NNRAS](https://www.ras.org.uk/news-and-press/2641-new-version-of-the-mnras-latex-package) journal submissions

- [PeerJ](https://peerj.com) articles

- [Royal Society Open Science](http://rsos.royalsocietypublishing.org/) journal submissions

- [Sage](https://uk.sagepub.com/en-gb/eur/manuscript-submission-guidelines) journal submissions

- [Springer](https://www.springer.com/gp/livingreviews/latex-templates) journal submissions

- [Statistics in Medicine](http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1097-0258/homepage/la_tex_class_file.htm) journal submissions

- [Copernicus Publications](https://publications.copernicus.org) journal submissions

- [The R Journal](https://journal.r-project.org/) articles

Under the hood, LaTeX templates are used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax, and R code and its output can be seamlessly included using [knitr](https://yihui.name/knitr/).

Using **rticles** requires the prerequisites described below. You can get most of these automatically by installing the latest release of RStudio (instructions for using **rticles** without RStudio are also provided).

## Using rticles from RStudio

To use **rticles** from RStudio:

1. Install the latest [RStudio](http://www.rstudio.com/products/rstudio/download/).

2. Install the **rticles** package: 

    ```r    
    install.packages("rticles")
    ```
    
3. Use the **New R Markdown** dialog to create an article from one of the templates:

    ![New R Markdown](http://rmarkdown.rstudio.com/images/new_r_markdown.png)

## Using rticles outside of RStudio

1. Install [pandoc](http://pandoc.org) using the [instructions for your platform](https://github.com/rstudio/rmarkdown/blob/master/PANDOC.md).

2. Install the **rmarkdown** and **rticles** packages:

    ```r
    install.packages("rmarkdown")
    devtools::install_github("rstudio/rticles")
    ```

3. Use the `rmarkdown::draft()` function to create articles:

    ```r
    rmarkdown::draft("MyJSSArticle.Rmd", template = "jss_article", package = "rticles")
    rmarkdown::draft("MyRJournalArticle", template = "rjournal_article", package = "rticles")
    ```

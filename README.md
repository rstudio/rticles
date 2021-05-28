<!-- badges: start -->
[![R-CMD-check](https://github.com/rstudio/rticles/workflows/R-CMD-check/badge.svg)](https://github.com/rstudio/rticles/actions)
[![Downloads from the RStudio CRAN mirror](https://cranlogs.r-pkg.org/badges/rticles)](https://cran.r-project.org/package=rticles)
[![CRAN status](https://www.r-pkg.org/badges/version/rticles)](https://CRAN.R-project.org/package=rticles)
<!-- badges: end -->

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

The **rticles** package provides a suite of custom [R Markdown](https://rmarkdown.rstudio.com) LaTeX formats and templates for various formats. Most of the templates are provided and maintained by the community, and anyone can contribute a new template. See [How to contribute](#how-to-contribute) below.

Currently included templates and their contributors are the following:

| Journal | Contributors | Pull request | Output format |
|-|-|-|-|
| [ACM: Association for Computing Machinery](https://www.acm.org/publications/about-publications) | [@ramnathv](https://github.com/ramnathv) | [#8](https://github.com/rstudio/rticles/pull/8) | `acm_article()` |
| [ACS](https://pubs.acs.org) | [@yufree](https://github.com/yufree) | [#15](https://github.com/rstudio/rticles/pull/15) | `acs_article()` |
| [AEA: American Economic Association](https://www.aeaweb.org/journals/policies/templates) | [@sboysel](https://github.com/sboysel) | [#86](https://github.com/rstudio/rticles/pull/86) | `aea_articles()` |
| [AGU](https://agupubs.onlinelibrary.wiley.com/) | [@eliocamp](https://github.com/eliocamp) | [#199](https://github.com/rstudio/rticles/pull/99) | `agu_article()` |
| [AMS: American Meteorological Society](https://www.ametsoc.org/) | [@yufree](https://github.com/yufree) | [#96](https://github.com/rstudio/rticles/pull/96) | `ams_article()` |
| [ASA: American Statistical Association](https://www.amstat.org/) |  | [#111](https://github.com/rstudio/rticles/pull/111) | `asa_article()` |
| [arXiv](https://arxiv.org/) pre-prints based on George Kour's template | [@alexpghayes](https://github.com) | [#236](https://github.com/rstudio/rticles/pull/236) | `arxiv_article()` |
| [Bioinformatics](https://academic.oup.com/bioinformatics) | [@ShixiangWang](https://github.com/ShixiangWang) | [#297](https://github.com/rstudio/rticles/pull/297) | `bioinformatics_article()` |
| [Biometrics](https://biometrics.biometricsociety.org) | [@daltonhance](https://github.com/daltonhance) | [#170](https://github.com/rstudio/rticles/pull/170) | `biometrics_article()` |
| [Bulletin de l'AMQ](https://www.amq.math.ca/bulletin/) | [@desautm](https://github.com/desautm) | [#145](https://github.com/rstudio/rticles/pull/145) | `amq_article()` |
| [Copernicus Publications](https://publications.copernicus.org) | [@nuest](https://github.com/nuest), [@RLumSK](https://github.com/RLumSK) | [#172](https://github.com/rstudio/rticles/pull/172), [#342](https://github.com/rstudio/rticles/pull/342) | `copernicus_article()` |
| [CTeX](https://ctan.org/pkg/ctex) |  |  | `ctex()` |
| [Elsevier](https://www.elsevier.com) | [@cboettig](https://github.com/cboettig) | [#27](https://github.com/rstudio/rticles/pull/27) | `elsevier_article()` |
| [Frontiers](https://www.frontiersin.org/) | [@muschellij2](https://github.com/muschellij2) | [#211](https://github.com/rstudio/rticles/pull/211) | `frontiers_article()` |
| [IEEE Transaction](http://www.ieee.org/publications_standards/publications/authors/author_templates.html) | [@Emaasit](https://github.com/Emaasit), [@espinielli](https://github.com/espinielli),  [@nathanweeks](https://github.com/nathanweeks), [@DunLug](https://github.com/DunLug) | [#97](https://github.com/rstudio/rticles/pull/97), [#169](https://github.com/rstudio/rticles/pull/169), [#227](https://github.com/rstudio/rticles/pull/227), [#263](https://github.com/rstudio/rticles/pull/263), [#264](https://github.com/rstudio/rticles/pull/264), [#265](https://github.com/rstudio/rticles/pull/265) | `ieee_article()` |
| [IMS: Institute of Mathematical Statistics](https://imstat.org/) [AoAS: Annals of Applied Statistics](https://imstat.org/journals-and-publications/annals-of-applied-statistics/) | [@auzaheta](https://github.com/auzaheta) | [#372](https://github.com/rstudio/rticles/pull/372) | `ims_article()` |
| [JASA: Journal of the Acoustical Society of America](https://asa.scitation.org/journal/jas) | [@stefanocoretta](https://github.com/stefanocoretta) | [#364](https://github.com/rstudio/rticles/pull/364) | `jasa_article()` |
| [JOSS: Journal of Open Source Software](https://joss.theoj.org/) [JOSE: Journal of Open Source Education](https://jose.theoj.org/) | [@noamross](https://github.com/noamross) | [#229](https://github.com/rstudio/rticles/pull/229) | `joss_article()` |
| [JSS: Journal of Statistical Software](https://www.jstatsoft.org) |  |  | `jss_article()` |
| [LIPIcs](https://www.dagstuhl.de/en/publications/lipics) | [@nuest](https://github.com/nuest) | [#288](https://github.com/rstudio/rticles/pull/288) | `lipics_article()` |
| [MDPI](https://www.mdpi.com) | [@dleutnant](https://github.com/dleutnant) | [#147](https://github.com/rstudio/rticles/pull/147) | `mdpi_article()` |
| [MNRAS: Monthly Notices of the Royal Astronomical Society](https://academic.oup.com/mnras) | [@oleskiewicz](https://github.com/oleskiewicz) | [#175](https://github.com/rstudio/rticles/pull/175) | `mnras_article()` |
| [OUP: Oxford University Press](https://academic.oup.com/journals/pages/authors/preparing_your_manuscript) | [@dmkaplan](https://github.com/dmkaplan) | [#284](https://github.com/rstudio/rticles/pull/284) | `oup_articles()` |
| [PeerJ: Journal of Life and Environmental Sciences](https://peerj.com) | [@zkamvar](https://github.com/zkamvar) | [#127](https://github.com/rstudio/rticles/pull/127) | `peerj_article()` |
| [PiHPh: Papers in Historical Phonology](http://journals.ed.ac.uk/pihph/about/submissions) | [@stefanocoretta](https://github.com/stefanocoretta) | [#362](https://github.com/rstudio/rticles/pull/362) | `pihph_article()` |
| [PLOS](https://plos.org/#journals) | [@sjmgarnier](https://github.com/sjmgarnier) | [#12](https://github.com/rstudio/rticles/pull/12) | `plos_article()` |
| [PNAS: Proceedings of the National Academy of Sciences](https://www.pnas.org/) | [@cboettig](https://github.com/cboettig) | [#72](https://github.com/rstudio/rticles/pull/72) | `pnas_article()` |
| [RSOS: Royal Society Open Science](https://www.royalsocietypublishing.org/journal/rsos) | [@ThierryO](https://github.com/ThierryO) | [#135](https://github.com/rstudio/rticles/pull/135) | `rsos_article()` |
| [RSS: Royal Statistical Society](https://rss.org.uk/) | [@carlganz](https://github.com/carlganz) | [#110](https://github.com/rstudio/rticles/pull/110) | `rss_article()` |
| [Sage](https://uk.sagepub.com/en-gb/eur/manuscript-submission-guidelines) | [@oguzhanogreden](https://github.com/oguzhanogreden) | [#181](https://github.com/rstudio/rticles/pull/181) | `sage_article()` |
| [Springer](https://www.springer.com/gp/livingreviews/latex-templates) | [@strakaps](https://github.com/strakaps) | [#164](https://github.com/rstudio/rticles/pull/164) | `springer_article()` |
| [SIM: Statistics in Medicine](https://onlinelibrary.wiley.com/journal/10970258) | [@ellessenne](https://github.com/ellessenne) | [#231](https://github.com/rstudio/rticles/pull/231) | `sim_article()` |
| [Taylor & Francis](https://www.tandfonline.com/) | [@dleutnant](https://github.com/dleutnant) | [#218](https://github.com/rstudio/rticles/pull/218) | `tf_article()` |
| [The R Journal](https://journal.r-project.org/) |  |  | `rjournal_article()` |


You can also get the list of available journal names with `rticles::journals()`. 

Under the hood, LaTeX templates are used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax, and R code and its output can be seamlessly included using [knitr](https://yihui.org/knitr/).

Using **rticles** requires the prerequisites described below. You can get most of these automatically by installing the latest release of RStudio (instructions for using **rticles** without RStudio are also provided).

## Using rticles from RStudio

To use **rticles** from RStudio:

1. Install the latest [RStudio](https://rstudio.com/products/rstudio/download/).

2. Install the **rticles** package. 

3. Use the **New R Markdown** dialog to create an article from one of the templates:

    ![New R Markdown](https://rmarkdown.rstudio.com/images/new_r_markdown.png)

## Using rticles outside of RStudio

1. Install [Pandoc](https://pandoc.org) using the [instructions for your platform](https://rmarkdown.rstudio.com/docs/articles/pandoc.html).

2. Install the **rticles** packages.

3. Use the `rmarkdown::draft()` function to create articles:

    ```r
    rmarkdown::draft("MyJSSArticle.Rmd", template = "jss", package = "rticles")
    rmarkdown::draft("MyRJournalArticle", template = "rjournal", package = "rticles")
    ```
   This will create a folder containing a Rmd file using the corresponding output format and all the assets required by this format. 

## How to contribute? 

Most of the templates are contributed directly by the users in the community. If you want **rticles** to offer a new journal format, you can contribute by the following way.

### Suggest an idea for new format opening an issue.

You may not feel confident enough or may not have time to contribute a new format. By opening a new issue, you can share the idea for this format, and see if someone in the community can help on it.  
This is not the best way to quickly get your format included but at least it is a great way to see if others are insterested too.

To see the existing suggested formats, just filter issues with the [help wanted](https://github.com/rstudio/rticles/labels/help%20wanted) label. You can then add a :+1: or help to add the template :wink:.

### Contribute a new template format opening a pull request.

To contribute a new format, you need to open a new pull request (PR). When opening the PR, you'll see the [PR template](https://github.com/rstudio/rticles/blob/master/.github/PULL_REQUEST_TEMPLATE.md) explaining how to proceed and what is important to check. Please follow it.  
Even if you are just starting or you are not finished, you share your work by creating a [draft PR](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests#draft-pull-requests). It is a great way to let us know that you are still working on it (like [these opened ones](https://github.com/rstudio/rticles/pulls?q=is%3Apr+draft%3Atrue+)), and it is also a great way to ask for help from the community.  
When you are ready, you can submit the PR for review, and we will iterate until it is merged.

#### Technical resources helpful to contribute a template

The best way to get started is to look at the previous examples of submitted PR. You'll find links to them in the table [above](#overview).

All the `rticles` format are build similarly by providing a new pandoc tex template to replace the default one. You'll learn more about pandoc templates in these places:

* [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/latex-template.html)
* [The Pandoc manual](https://pandoc.org/MANUAL.html#templates)

You can study [existing formats](inst/rmarkdown/templates) to see how all this works.

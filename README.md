### Overview

The **rticles** package includes a set of [R Markdown](http://rmarkdown.rstudio.com) templates that enable authoring of R related journal and conference submissions. Available templates include:

- [JSS](http://www.jstatsoft.org/) articles

- [R Journal](http://journal.r-project.org/) articles

- [useR](http://user2014.stat.ucla.edu/) conference abstracts

- [Public Library of Science (PLoS)](http://www.plos.org/) articles

- [CTeX](http://ctex.org) documents

- [ACS](http://pubs.acs.org) articles

Under the hood, LaTeX templates are used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](http://rmarkdown.rstudio.com/authoring_basics.html) syntax, and R code and it's output can be seamlessly included using [knitr](http://yihui.name/knitr/).

Using **rticles** has some prerequisites which are described below. You can get most of these pre-requisites automatically by installing the latest preview release of RStudio (instructions for using **rticles** without RStudio are also provided).

### Using rticles from RStudio

To use **rticles** from RStudio:

1) Install the latest [RStudio Preview Release](http://www.rstudio.com/ide/download/preview).

2) Install the **rticles** package: 

```S
devtools::install_github("rstudio/rticles")
```

3) Use the **New R Markdown** dialog to create an article from one of the templates:

![New R Markdown](http://rmarkdown.rstudio.com/images/new_r_markdown.png)
    
    
### Using rticles outside of RStudio

1) Install [pandoc](http://johnmacfarlane.net/pandoc/) using the [instructions for your platform](https://github.com/rstudio/rmarkdown/blob/master/PANDOC.md).

2) Install the **rmarkdown** and **rticles** packages:

```S
devtools::install_github(c("rstudio/rmarkdown", "rstudio/rticles"))
```
    
3) Use the `rmarkdown::draft` function to create articles:

```S
rmarkdown::draft("MyAbstract.Rmd", template = "use_r_abstract", package = "rticles")
rmarkdown::draft("MyJSSArticle.Rmd", template = "jss_article", package = "rticles")
rmarkdown::draft("MyRJournalArticle", template = "rjournal_article", package = "rticles")
```


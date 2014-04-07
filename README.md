## Article Formats for R Markdown

### Installation

The **rticles** package is based on [R Markdown v2](http://rmarkdown.rstudio.com), which is included in the latest [preview release of RStudio](http://www.rstudio.com/ide/download/preview). You should update RStudio to the most recent preview release (v0.98.760 or higher) before using rticles.

Note that if you are not using RStudio then you can alteratively install the standalone [rmarkdown](https://github.com/rstudio/rmarkdown) package.

To install the **rticles** package:

```S
devtools::install_github("rticles", "rstudio")
```

### Usage

Within RStudio you can create a new document based on an rticles template using the **New R Markdown** dialog:

![New R Markdown](http://rmarkdown.rstudio.com/images/new_r_markdown.png)


If you are not using RStudio then you can also create a new article using the `rmarkdown::draft` function as follows:

```S
rmarkdown::draft("MyAbstract.Rmd", template = "use_r_abstract", package = "rticles")
rmarkdown::draft("MyJSSArticle.Rmd", template = "jss_template", package = "rticles")
```





## Article Formats for R Markdown

### Installation

The **rticles** package is based on [R Markdown v2](http://rmarkdown.rstudio.com), which is included in the latest [preview release of RStudio](http://www.rstudio.com/ide/download/preview). You should update RStudio to the the most recent preview release (v0.98.709 or higher) before using **rticles**.

Note that if you are not using RStudio then you can alteratively install the standalone [rmarkdown](https://github.com/rstudio/rmarkdown) package.

To install the **rticles** package:

```S
install_packages("devtools")
devtools::install_github("rstudio/rticles")
```

### Usage

To create a new article call the `rmarkdown::draft` function with the name of the file and the template you want to use:

```S
rmarkdown::draft("MyAbstract.Rmd", template = "use_r_abstract", package = "rticles")
```





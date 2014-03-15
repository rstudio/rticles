## Article Formats for R Markdown

### Installation

```r
devtools::install_github("rstudio/rticles")
```

You should also be running the [preview release](http://www.rstudio.com/ide/preview) of RStudio. Alternatively if you are not using RStudio you should install the [rmarkdown](https://github.com/rstudio/rmarkdown) package.

### Usage

To create a new article call the `author` function with the name of the file to author and the article template you want to use:

```r
rticles::author("MyAbstract.Rmd", "use_r_abstract")
```





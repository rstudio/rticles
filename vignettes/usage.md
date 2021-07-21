

To use **rticles** from RStudio, you can access the templates through `File -> New File -> R Markdown`. This will open the dialog box where you can select from one of the available templates:

![New R Markdown](https://bookdown.org/yihui/rmarkdown/images/rticles-templates.png)
    
 
If you are not using RStudio, you'll also need to install [Pandoc](https://pandoc.org) following these [instructions](https://bookdown.org/yihui/rmarkdown-cookbook/install-pandoc.html). Then, use the `rmarkdown::draft()` function to create articles:

```r
rmarkdown::draft(
    "MyJSSArticle.Rmd", template = "jss", package = "rticles"
)
rmarkdown::draft(
    "MyRJournalArticle", template = "rjournal", package = "rticles"
)
```
   
   This will create a folder containing a Rmd file using the corresponding output format and all the assets required by this format. 

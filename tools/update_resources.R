# Helper script for updating .cls file in this package

# JSS article -------------------------------------------------------------
# From https://www.jstatsoft.org/pages/view/style
dir.create(tmp_dir <- tempfile())
bundle <- "https://www.jstatsoft.org/public/journals/1/jss-article-tex.zip"
new_jss <- xfun::in_dir(tmp_dir, {
  xfun::download_file(bundle)
  unzip(basename(bundle))
  xfun::normalize_path(
    c(cls = "jss.cls", bst = "jss.bst", logo = "jsslogo.jpg")
  )
})
file.copy(new_jss,
          "inst/rmarkdown/templates/jss/skeleton/",
          overwrite = TRUE)
unlink(tmp_dir, recursive = TRUE)
# Check git diff and commit

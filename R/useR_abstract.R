

#' @export
useR_abstract <- function() {
  template <- find_file("useR_abstract", "template.tex")
  csl <- find_file("useR_abstract" ,"chicago-author-date.csl")

  rmarkdown::pdf_document(
    template = template,
    keep_tex = TRUE,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}


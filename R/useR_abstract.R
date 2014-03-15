#' @export
useR_abstract <- function() {
  template <- find_resource("useR_abstract", "template.tex")
  csl <- find_resource("useR_abstract" ,"chicago-author-date.csl")

  rmarkdown::pdf_document(
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}


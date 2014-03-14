

#' @export
useR_abstract <- function() {
  template <- system.file("rmarkdown/useR_abstract/template.tex",
                          package = "rticles")
  csl <- system.file("rmarkdown/useR_abstract/chicago-author-date.csl",
                     package = "rticles")

  rmarkdown::pdf_document(
    template = template,
    keep_tex = TRUE,
    pandoc_args = c("--csl", pandoc_path_arg(csl)))
}


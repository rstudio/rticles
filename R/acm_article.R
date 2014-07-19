#' @export
acm <- function() {
  template <- find_resource("acm", "template.tex")
  csl <- find_resource("acm" ,"acm-sig-proceedings.csl")

  rmarkdown::pdf_document(
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}


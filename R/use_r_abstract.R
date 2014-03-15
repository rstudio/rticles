#' @export
use_r_abstract <- function() {
  template <- find_resource("use_r_abstract", "template.tex")
  csl <- find_resource("use_r_abstract" ,"chicago-author-date.csl")

  rmarkdown::pdf_document(
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}


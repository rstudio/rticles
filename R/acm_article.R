#' Association for Computing Machinery (ACM) format.
#'
#' Format for creating an Association for Computing Machinery (ACM) articles.
#' Adapted from
#' \href{http://www.acm.org/publications/article-templates/proceedings-template.html}{http://www.acm.org/publications/article-templates/proceedings-template.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#'
#' @export
acm <- function() {
  template <- find_resource("acm", "template.tex")
  csl <- find_resource("acm" ,"acm-sig-proceedings.csl")

  rmarkdown::pdf_document(
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}


#' Association for Computing Machinery (ACM) format.
#'
#' Format for creating an Association for Computing Machinery (ACM) articles.
#' Adapted from
#' \url{http://www.acm.org/publications/article-templates/proceedings-template.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document()}.
#' @return An R Markdown output format.
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "acm_article", package = "rticles")
#' }
#' @export
acm_article <- function(...) {
  pdf_document_format("acm_article", csl = "acm-sig-proceedings.csl", ...)
}


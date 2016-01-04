#' Association for Computing Machinery (ACM) format.
#'
#' Format for creating an Association for Computing Machinery (ACM) articles.
#' Adapted from
#' \href{http://www.acm.org/publications/article-templates/proceedings-template.html}{http://www.acm.org/publications/article-templates/proceedings-template.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @export
acm_article <- function(...) {
  pdf_document_format(...,
                      format = "acm_article",
                      template = "template.tex",
                      csl = "acm-sig-proceedings.csl")
}


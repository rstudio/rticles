#' Association for Computing Machinery (ACM) format.
#'
#' Format for creating an Association for Computing Machinery (ACM) articles.
#' Adapted from
#' \href{http://www.acm.org/publications/article-templates/proceedings-template.html}{http://www.acm.org/publications/article-templates/proceedings-template.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @export
acm_article <- function(...) {
  pdf_document_format(...,
                      format = "acm_article",
                      csl = "acm-sig-proceedings.csl",
                      template = "template.tex"
                      )
}


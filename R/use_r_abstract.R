#' useR conference abstract format.
#'
#' Format for useR conference abstracts. Adapted from
#' \href{http://user2016.org/}{http://user2016.org/}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @export
use_r_abstract <- function(...) {
  pdf_document_format(...,
                      format = "use_r_abstract",
                      template = "template.tex",
                      csl = "chicago-author-date.csl")
}

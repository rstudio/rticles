#' Journal of the American Chemical Society (ACS) format.
#'
#' Format for creating an American Chemical Society (ACS) articles. Adapted from \href{http://pubs.acs.org/page/4authors/submission/tex.html}{http://pubs.acs.org/page/4authors/submission/tex.html}.
#'
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @export
acs_article <- function(..., fig_caption = TRUE, keep_tex = TRUE) {
  pdf_document_format(...,
                      fig_caption = fig_caption,
                      keep_tex = keep_tex,
                      format = "acs_article",
                      template = "template.tex",
                      csl = "american-chemical-society.csl")
}

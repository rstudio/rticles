#' PeerJ journal format.
#'
#' Format for creating submissions to The PeerJ.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "peerj_article", package = "rticles")
#' }
#'
#' @export
peerj_article <- function(..., keep_tex = TRUE) {
  inherit_pdf_document(...,
                       keep_tex = keep_tex,
                       template = find_resource("peerj_article", "template.tex"))
}

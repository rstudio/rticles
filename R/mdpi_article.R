#' MDPI journal format.
#'
#' Format for creating submissions to Multidisciplinary Digital Publishing
#' Institute (MDPI) journals. Adapted from
#' \href{http://www.mdpi.com/authors/latex}{http://www.mdpi.com/authors/latex}.
#' The CSL file was obtained from \href{https://www.zotero.org/styles?q=mdpi}{https://www.zotero.org/styles?q=mdpi}.
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
#' draft("MyArticle.Rmd", template = "mdpi_article", package = "rticles")
#' }
#'
#' @export
mdpi_article <- function(..., keep_tex = TRUE) {
  pdf_document_format(...,
                      keep_tex = keep_tex,
                      format = "mdpi_article",
                      template = "template.tex",
                      csl = "multidisciplinary-digital-publishing-institute.csl")
}

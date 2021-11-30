#' GigaScience journal format.
#'
#' Format for creating submissions to the GigaScience journal. Adapted from GigaScience Overleaf template
#' <https://www.overleaf.com/latex/templates/template-for-gigascience-journal-manuscript-submissions/shgtrssvbjhs>.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to [rmarkdown:render()]
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "gigascience_article", package = "rticles")
#' }
#'
#' @export
gigascience_article <- function(keep_tex = TRUE,
                                md_extensions = c("-autolink_bare_uris"),
                                ...) {
  pdf_document_format("gigascience",
                      keep_tex = keep_tex,
                      md_extensions = md_extensions,
                      ...)
}

#' PLOS journal format.
#'
#' Format for creating submissions to PLOS journals. Adapted from
#' \href{http://journals.plos.org/ploscompbiol/s/latex}{http://journals.plos.org/ploscompbiol/s/latex}.
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
#' draft("MyArticle.Rmd", template = "plos_article", package = "rticles")
#' }
#'
#' @export
plos_article <- function(...,
                             keep_tex = TRUE,
                             md_extensions = c("-autolink_bare_uris")) {
  inherit_pdf_document(...,
                       template = find_resource("plos_article", "template.tex"),
                       keep_tex = keep_tex,
                       md_extensions = md_extensions)
}

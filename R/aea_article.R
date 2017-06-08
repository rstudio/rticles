#' American Economic Association journal submissions.
#'
#' Format for creating submissions to the American Economic Association (AER, AEJ, JEL, PP).
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
#' draft("MyArticle.Rmd", template = "aea_article", package = "rticles")
#' }
#'
#' @export
aea_article <- function(...,
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris")) {
  inherit_pdf_document(...,
                       template = find_resource("aea_article", "template.tex"),
                       keep_tex = keep_tex,
                       md_extensions = md_extensions)
}

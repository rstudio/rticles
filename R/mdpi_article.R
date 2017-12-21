#' MDPI journal format.
#'
#' Format for creating submissions to MDPI journals.
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
  inherit_pdf_document(...,
                       keep_tex = keep_tex,
                       template = "~/Git/GitHub/rticles/inst/rmarkdown/templates/mdpi_article/resources/template.tex") #find_resource("mdpi_article", "template.tex"))
}

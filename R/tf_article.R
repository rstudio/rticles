#' Taylor and Fracis journal format.
#'
#' Format for creating submissions to a Taylor & Francis journal. Adapted from
#' \href{http://www.tandf.co.uk/journals/authors/InteractCADLaTeX.zip}
#' {http://www.tandf.co.uk/journals/authors/InteractCADLaTeX.zip}.
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
#' draft("MyArticle.Rmd", template = "tf_article", package = "rticles")
#' }
#'
#' @export
tf_article <- function(..., keep_tex = TRUE) {
  inherit_pdf_document(...,
                      keep_tex = keep_tex,
                      template = find_resource("tf_article", "template.tex"),
                      citation_package = "natbib")
}

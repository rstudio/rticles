#' American Statistical Association (ASA) Journal format.
#'
#' This format was adapted from The American Statistican format, but it
#' should be fairly consistent across ASA journals
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @inheritParams peerj_article
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @note If you use \code{rmarkdown::pdf_document()}, all internal references
#' (i.e. tables and figures) must use \code{\\ref\{\}} whereas with
#' \code{bookdown::pdf_document2()}, you can additionally use \code{\\@@ref()}.
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "asa_article", package = "rticles")
#' }
#'
#' @export
asa_article <- function(..., keep_tex = TRUE, citation_package = 'natbib',
                        base_format = rmarkdown::pdf_document) {
  if (inherits(base_format, "character")){
    FMT <- eval(parse(text = base_format))
  } else {
    FMT <- match.fun(base_format)
  }
  out <- FMT(...,
             citation_package = citation_package,
             keep_tex = keep_tex,
             template = find_resource("asa_article", "template.tex"))
}

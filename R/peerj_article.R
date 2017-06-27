#' PeerJ journal format.
#'
#' Format for creating submissions to The PeerJ.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @param base_format The function to use for the base format of the article. 
#'   By default, this is \code{rmarkdown::pdf_document}, but to use pandoc's 
#'   cross-referencing feature, this can be set to \code{bookdown::pdf_document2}
#' 
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
peerj_article <- function(..., keep_tex = TRUE, base_format = rmarkdown::pdf_document) {
  if (inherits(base_format, "character")){
	FMT <- eval(parse(text = base_format))
  } else {
	FMT <- match.fun(base_format)
  }
  out <- FMT(...,
			 keep_tex = keep_tex,
			 template = find_resource("peerj_article", "template.tex"))
}

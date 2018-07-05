#' Monthly Notices of the Royal Astronomical Society (MNRAS) Journal format.
#'
#' Format for creating an Monthly Notices of Royal Astronomical Society (MNRAS) Journal articles.
#' Adapted from
#' \href{https://www.ras.org.uk/news-and-press/2641-new-version-of-the-mnras-latex-package}{https://www.ras.org.uk/news-and-press/2641-new-version-of-the-mnras-latex-package}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "mnras_article", package = "rticles")
#' }
#'
#' @export
mnras_article <- function(...,
                          keep_tex = TRUE,
                          md_extensions = c(),
                          fig_caption = TRUE) {
    pdf_document_format(...,
                        keep_tex = keep_tex,
                        md_extensions = md_extensions,
                        format = "mnras_article",
                        template = "template.tex",
                        csl = "mnras.csl")
}

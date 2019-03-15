#' Monthly Notices of the Royal Astronomical Society (MNRAS) Journal format.
#'
#' Format for creating an Monthly Notices of Royal Astronomical Society (MNRAS)
#' Journal articles. Adapted from
#' \url{https://www.ras.org.uk/news-and-press/2641-new-version-of-the-mnras-latex-package}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @export
mnras_article <- function(..., keep_tex = TRUE, fig_caption = TRUE) {
  pdf_document_format(
    "mnras_article", keep_tex = keep_tex, fig_caption = fig_caption, ...
  )
}

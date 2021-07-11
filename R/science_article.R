#' Science Journal Format
#'
#' Format for creating submissions to Science. Based on the Science
#' \href{https://www.sciencemag.org/site/feature/contribinfo/prep/TeX_help/#downloads}{class}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @md
#' @export
science_article <- function(..., keep_tex = TRUE, number_sections = FALSE) {
  base <- pdf_document_format(
    "science", keep_tex = keep_tex, number_sections = number_sections,...
  )
}

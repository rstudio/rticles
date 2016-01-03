#' Journal of the American Chemical Society (ACS) format.
#'
#' Format for creating an American Chemical Society (ACS) articles. Adapted from \href{http://pubs.acs.org/page/4authors/submission/tex.html}{http://pubs.acs.org/page/4authors/submission/tex.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#'
#' @export
acs <- function(keep_tex = TRUE) {
  template <- find_resource("acs", "template.tex")
  csl <- find_resource("acs", "american-chemical-society.csl")

  rmarkdown::pdf_document(
    keep_tex = keep_tex,
    fig_caption = TRUE,
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}

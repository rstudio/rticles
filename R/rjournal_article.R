#' R Journal format.
#'
#' @description
#' `r lifecycle::badge('deprecated')`
#'
#' This function is now defunct in favor of the [**rjtools**](https://rjournal.github.io/rjtools/) package
#' which is now officialy recommanded by R Journal <https://rjournal.github.io/submissions.html>.
#'
#' @internal
rjournal_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {

  lifecycle::deprecate_stop("0.25", "rjournal_article()", "rjtools::rjournal_pdf_article()", details = "See official recommandation at https://rjournal.github.io/submissions.html")

}

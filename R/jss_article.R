#' @export
jss_article <- function() {
  template <- find_resource("jss_article", "template.tex")

  rmarkdown::pdf_document(template = template, keep_tex = TRUE)
}


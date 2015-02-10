#' @export
elsevier <- function() {
  template <- find_resource("elsevier", "template.tex")
  base <- rmarkdown::pdf_document(template = template, keep_tex = TRUE)
  base
}

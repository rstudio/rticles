#' @export
acs <- function(keep_tex = TRUE) {
  template <- find_resource("acs", "template.tex")
  csl <- find_resource("acs" ,"american-chemical-society.csl")

  rmarkdown::pdf_document(
    keep_tex = keep_tex,
    fig_caption = T,
    template = template,
    pandoc_args = c("--csl", rmarkdown::pandoc_path_arg(csl)))
}

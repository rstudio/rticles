#' @export
rjournal_article <- function() {
  template <- find_resource("rjournal_article", "template.tex")

  base <- rmarkdown::pdf_document(template = template, keep_tex = TRUE)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "#>"

  hook_chunk <- function(x, options) {
    if (knitr:::output_asis(x, options)) return(x)
    paste0('\\begin{example}\n', x, '\\end{example}')
  }
  hook_input <- function(x, options) paste0(x, "\n")
  hook_output <- function(x, options) paste0(x, "\n")

  base$knitr$knit_hooks$chunk   <- hook_chunk
  base$knitr$knit_hooks$source  <- hook_input
  base$knitr$knit_hooks$output  <- hook_output
  base$knitr$knit_hooks$message <- hook_output
  base$knitr$knit_hooks$warning <- hook_output

  base
}

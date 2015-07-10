#' @export
jss_article <- function() {
  template <- find_resource("jss_article", "template.tex")

  base <- rmarkdown::pdf_document(template = template, keep_tex = TRUE)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_knit$out.format <- "sweave"

  base$knitr$opts_chunk$prompt <- TRUE
  base$knitr$opts_chunk$comment <- NA
  base$knitr$opts_chunk$highlight <- FALSE

  base$knitr$opts_chunk$dev.args <- list(pointsize = 11)
  base$knitr$opts_chunk$fig.width <- 4.9 # 6.125" * 0.8, as in template
  base$knitr$opts_chunk$fig.height <- 3.675 # 4.9 * 3:4
  base$knitr$opts_chunk$fig.align <- "center"

  hook_chunk <- function(x, options) {
    if (knitr:::output_asis(x, options)) return(x)
    paste0('\\begin{CodeChunk}\n', x, '\\end{CodeChunk}')
  }
  hook_input <- function(x, options) {
    paste0(c('\\begin{CodeInput}', x, '\\end{CodeInput}', ''),
      collapse = '\n')
  }
  hook_output <- function(x, options) {
    paste0('\\begin{CodeOutput}\n', x, '\\end{CodeOutput}\n')
  }

  base$knitr$knit_hooks$chunk   <- hook_chunk
  base$knitr$knit_hooks$source  <- hook_input
  base$knitr$knit_hooks$output  <- hook_output
  base$knitr$knit_hooks$message <- hook_output
  base$knitr$knit_hooks$warning <- hook_output

  base
}

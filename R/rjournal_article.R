#' @export
rjournal_article <- function() {
  template <- find_resource("rjournal_article", "template.tex")

  base <- rmarkdown::pdf_document(template = template)
  # Render will generate tex file, post-process hook generates appropriate
  # RJwrapper.tex and use pandoc to build pdf from that
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"

  base$post_processor <- function(metadata, utf8_input, output_file, clean, verbose) {
    filename <- tools::file_path_sans_ext(basename(output_file))
    wrapper_metadata <- list(preamble = metadata$preable, filename = filename)
    wrapper_template <- find_resource("rjournal_article", "RJwrapper.tex")
    wrapper_output <- file.path(getwd(), "RJwrapper.tex")
    template_pandoc(wrapper_metadata, wrapper_template, wrapper_output, verbose)

    tools::texi2pdf("RJwrapper.tex", clean = clean)
    "RJwrapper.pdf"
  }

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "#>"

  hook_chunk = function(x, options) {
    if (knitr:::output_asis(x, options)) return(x)
    paste('\\begin{Schunk}\n', x, '\\end{Schunk}', sep = '')
  }
  hook_input <- function(x, options)
    paste(c('\\begin{Sinput}', knitr:::hilight_source(x, 'sweave', options), '\\end{Sinput}', ''),
      collapse = '\n')
  hook_output <- function(x, options) paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')

  base$knitr$knit_hooks$chunk   <- hook_chunk
  base$knitr$knit_hooks$source  <- hook_input
  base$knitr$knit_hooks$output  <- hook_output
  base$knitr$knit_hooks$message <- hook_output
  base$knitr$knit_hooks$warning <- hook_output
  base$knitr$knit_hooks$plot <- knitr:::hook_plot_tex

  base
}

#' Render a pandoc template.
#'
#' This is a hacky way to access the pandoc templating engine.
#'
#' @param metadata A named list containing metadata to pass to template.
#' @param template Path to a pandoc template.
#' @param output Path to save output.
#' @return (Invisibly) The path of the generate file.
#' @examples
#' x <- rticles:::template_pandoc(
#'   list(preamble = "%abc", filename = "wickham"),
#'   rticles:::find_resource("rjournal_article", "RJwrapper.tex"),
#'   tempfile()
#' )
#' if (interactive()) file.show(x)
template_pandoc <- function(metadata, template, output, verbose = FALSE) {
  tmp <- tempfile(fileext = ".md")
  on.exit(unlink(tmp))

  cat("---\n", file = tmp)
  cat(yaml::as.yaml(metadata), file = tmp, append = TRUE)
  cat("---\n", file = tmp, append = TRUE)
  cat("\n", file = tmp, append = TRUE)

  rmarkdown::pandoc_convert(tmp, "markdown", output = output,
    options = paste0("--template=", template), verbose = verbose)

  invisible(output)
}

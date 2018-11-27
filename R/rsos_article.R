#' Royal Society Open Science journal format.
#'
#' Format for creating submissions to Royal Society Open Science journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @export
#' @importFrom rmarkdown output_format knitr_options pandoc_options pandoc_variable_arg includes_to_pandoc_args
#' @author Thierry Onkelinx, \email{thierry.onkelinx@@inbo.be}
rsos_article <- function(
  ..., keep_tex = TRUE, latex_engine = 'xelatex', pandoc_args = NULL,
  includes = NULL, fig_crop = TRUE
) {

  extra <- list(...)

  template <- system.file(
    "rmarkdown/templates/rsos_article/resources/template.tex", package = "rticles"
  )
  args <- c(
    "--template", template, pandoc_variable_arg("documentclass", "article"),
    pandoc_args, "--natbib", includes_to_pandoc_args(includes)
  )

  if (length(extra) > 0) args <- c(args, sapply(names(extra), function(x){
    pandoc_variable_arg(x, extra[[x]])
  }))

  opts_chunk <- list(
    latex.options = "{}", dev = "pdf", fig.align = "center", dpi = 300,
    fig.width = 4.5, fig.height = 2.9, highlight = FALSE, echo = FALSE
  )
  crop <- fig_crop && !identical(.Platform$OS.type, "windows") &&
    nzchar(Sys.which("pdfcrop"))
  if (crop) {
    knit_hooks <- list(crop = knitr::hook_pdfcrop)
    opts_chunk$crop <- TRUE
  } else {
    knit_hooks <- NULL
  }

  post_processor <- function(metadata, input_file, output_file, clean, verbose) {
    text <- xfun::read_utf8(output_file)

    # set correct text in fmtext environment
    end_first_page <- grep("^\\\\EndFirstPage", text) #nolint
    if (length(end_first_page)) {
      maketitle <- grep("\\\\maketitle", text) #nolint
      text <- c(
        text[1:(maketitle - 1)],
        "\\begin{fmtext}",
        text[(maketitle + 1):(end_first_page - 1)],
        "\\end{fmtext}",
        "\\maketitle",
        text[(end_first_page + 1):length(text)]
      )
    }
    xfun::write_utf8(text, output_file)
    output_file
  }

  output_format(
    knitr = knitr_options(
      opts_knit = list(width = 75, concordance = TRUE),
      opts_chunk = opts_chunk, knit_hooks = knit_hooks
    ),
    pandoc = pandoc_options(
      to = "latex", latex_engine = latex_engine, args = args, keep_tex = keep_tex
    ),
    post_processor = post_processor,
    clean_supporting = !keep_tex
  )
}

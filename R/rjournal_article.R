#' R Journal format.
#'
#' Format for creating R Journal articles. Adapted from
#' \url{https://journal.r-project.org/submissions.html}. In order to ease the
#' manuscript preparation, the output is collected in a separate output directory,
#' which can be used for the submission. If needed file names are renamed automatically.
#'
#' @details
#'
#' **The `author` field in the YAML header**
#'
#' \tabular{lll}{
#' FIELD \tab TYPE \tab DESCRIPTION\cr
#' `name` \tab *required* \tab name and surname of the author\cr
#' `affiliation` \tab *required* \tab name of the author's affiliation\cr
#' `address` \tab *required* \tab at least one address line for the affiliation\cr
#' `url` \tab *optional* \tab an additional url for the author or the main affiliation\cr
#' `orcid` \tab *optional* \tab the authors ORCID if available\cr
#' `email` \tab *required* \tab the author's e-mail address\cr
#' `affiliation2` \tab *optional* \tab name of the author's 2nd affiliation\cr
#' `address2` \tab *optional* \tab address lines belonging to the author's 2nd affiliation
#' }
#'
#' *Please note: Only one `url`, `orcid` and `email` can be provided per author.*
#'
#' **Other YAML fields**
#'
#' \tabular{lll}{
#' FIELD \tab TYPE \tab DESCRIPTION\cr
#' `bibliography` \tab *with default* \tab the BibTeX file with the reference entries\cr
#' `output_dir` \tab *with default* \tab output directory where all the files are stored ready for submission
#' }
#'
#' @param ...,citation_package Arguments to \code{rmarkdown::pdf_document}.
#'
#' @md
#' @export
rjournal_article <- function(..., citation_package = 'natbib') {

  rmarkdown::pandoc_available('2.2', TRUE)

  base <- pdf_document_format(
    "rjournal_article", highlight = NULL, citation_package = citation_package, ...
  )

  # Render will generate tex file, post-process hook generates appropriate
  # RJwrapper.tex and use pandoc to build pdf from that
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"

  base$post_processor <- function(
    metadata, utf8_input, output_file, clean, verbose
  ) {
    filename <- basename(output_file)
    # underscores in the filename will be problematic in \input{filename};
    # pandoc will escape underscores but it should not, i.e., should be
    # \input{foo_bar} instead of \input{foo\_bar}
    if (filename != (filename2 <- gsub('_', '-', filename))) {
      file.rename(filename, filename2); filename <- filename2
    }
    m <- list(filename = xfun::sans_ext(filename))
    h <- get_list_element(metadata, c('output', 'rticles::rjournal_article', 'includes', 'in_header'))
    h <- c(h, if (length(preamble <- unlist(metadata[c('preamble', 'header-includes')]))) {
      f <- tempfile(fileext = '.tex'); on.exit(unlink(f), add = TRUE)
      xfun::write_utf8(preamble, f)
      f
    })
    t <- find_resource("rjournal_article", "RJwrapper.tex")
    template_pandoc(m, t, "RJwrapper.tex", h, verbose)

    ##compile TEX and return the output file path on exit
    file <- tinytex::latexmk("RJwrapper.tex", base$pandoc$latex_engine, clean = clean)
    on.exit(return(file))

    ## below: additional treatment to meet the journal requirement; everything
    ## is collected within a folder defined by output_dir in the YAML-header

    ##first we have to make sure that we do not break old code
    ##check whether the new field exist, if not the user do not expect this
    ##new folder and the writing on the hard drive and consequently full stop
    if(is.null(metadata$output_dir))
      try(stop(), silent = TRUE)

    ##check also bibliography
    if(is.null(metadata$bibliography))
      metadata$bibliography <- "RJreferences.bib"

    ##get file path and set new output directory
    output_path <- dirname(normalizePath(output_file))
    output_dir <- paste(c(output_path, metadata$output_dir), collapse = "/")

    ##create subdirectory
    dir.create(output_dir, showWarnings = FALSE)

    ##create additional R-code file
    knitr::purl(
      input = normalizePath(output_file),
      output = paste0(output_dir,"/",xfun::sans_ext(output_file),".R"),
      documentation = 1)

    ##copy files from working directory to user-defined output folder
    file.copy(from = c(
      output_file,
      metadata$bibliography,
      "RJwrapper.tex",
      "RJwrapper.pdf"
    ), to = output_dir, overwrite = TRUE)

    ##correct bib-filename to match the name of the TEX-file
    file.rename(from = paste0(output_dir,"/",metadata$bibliography),
                to = paste0(output_dir,"/",xfun::sans_ext(output_file), ".bib"))

    ##correct BIB-file  ans TEX-file
    temp_tex <- readLines(paste0(output_dir,"/", output_file))

    ## correct bibliography
    pat <- regexpr("(?<=\\\\bibliography{).+[^}]", temp_tex, perl = TRUE)
    regmatches(temp_tex, pat) <- paste0(xfun::sans_ext(output_file), ".bib")


    ##correct authors field to have pattern Author 1, Author 2 and Author 3
    authors <-
      knitr::combine_words(
        unlist(
          strsplit(
            x = temp_tex[grepl(pattern = "\\author{", x = temp_tex, fixed = TRUE)],
            ",")))

    temp_tex[grepl(pattern = "\\author{", x = temp_tex, fixed = TRUE)] <- authors

    ##write TEX back to hard drive
    writeLines(text = temp_tex, con = paste0(output_dir,"/", output_file))

    ## copy and paste figures to output_dir. The LaTeX format make it a little bit
    ## difficult, however, the R Journal allows only PDF or PNG figures
    figures <- regmatches(temp_tex, regexec("(?<=\\\\includegraphics)(.*?){(.*?)}", temp_tex, perl = TRUE))
    figures <- as.character(stats::na.exclude(sapply(figures, function(x) x[3])))
    figures_files <- paste0(rep(figures, each = 2), c(".pdf", ".png"))
    suppressWarnings(file.copy(from = figures_files, to = output_dir, overwrite = TRUE, recursive = FALSE))

  }

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "#>"

  hilight_source <- knitr_fun('hilight_source')
  hook_chunk = function(x, options) {
    if (output_asis(x, options)) return(x)
    paste0('```{=latex}\n\\begin{Schunk}\n', x, '\\end{Schunk}\n```')
  }
  hook_input <- function(x, options)
    paste(c('\\begin{Sinput}', hilight_source(x, 'sweave', options), '\\end{Sinput}', ''),
          collapse = '\n')
  hook_output <- function(x, options) paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')

  base$knitr$knit_hooks <- merge_list(base$knitr$knit_hooks, list(
    chunk   = hook_chunk,
    source  = hook_input,
    output  = hook_output,
    message = hook_output,
    warning = hook_output,
    plot = knitr::hook_plot_tex
  ))

  base
}





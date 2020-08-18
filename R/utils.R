find_resource <- function(template, file = 'template.tex') {
  res <- pkg_file("rmarkdown", "templates", template, "resources", file)
  if (res == "") stop(
    "Couldn't find template file ", template, "/resources/", file, call. = FALSE
  )
  res
}

knitr_fun <- function(name) utils::getFromNamespace(name, 'knitr')

output_asis <- knitr_fun('output_asis')

merge_list <- function(x, y) {
  fun <- knitr_fun('merge_list')
  fun(as.list(x), y)
}

#' Render a pandoc template.
#'
#' This is a hacky way to access the pandoc templating engine.
#'
#' @param metadata A named list containing metadata to pass to template.
#' @param template Path to a pandoc template.
#' @param output Path to save output.
#' @param in_header Paths to files to include in the header.
#' @return (Invisibly) The path of the generate file.
#' @examples
#' x <- rticles:::template_pandoc(
#'   list(preamble = "%abc", filename = "wickham"),
#'   rticles:::find_resource("rjournal_article", "RJwrapper.tex"),
#'   tempfile()
#' )
#' if (interactive()) file.show(x)
#' @noRd
template_pandoc <- function(metadata, template, output, in_header = NULL, verbose = FALSE) {
  tmp <- tempfile(fileext = ".md"); on.exit(unlink(tmp), add = TRUE)
  xfun::write_utf8(c("---", yaml::as.yaml(metadata), "---\n"), tmp)

  rmarkdown::pandoc_convert(
    tmp, output = output, verbose = verbose, wd = '.',
    options = c(
      "--template", rmarkdown::pandoc_path_arg(template),
      rmarkdown::pandoc_include_args(in_header)
    )
  )
  invisible(output)
}

# Helper function to create a custom format derived from pdf_document that
# includes a custom LaTeX template
pdf_document_format <- function(
  format, template = find_resource(format, 'template.tex'), ...
) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  fmt
}

# recursion into a list to get an element using a vector of names
get_list_element <- function(x, names) {
  n <- length(names)
  if (!is.list(x) || n == 0) return()
  for (i in names[seq_len(n - 1)]) if (!is.list(x <- x[[i]])) return()
  x[[names[n]]]
}

pkg_file <- function(...) system.file(..., package = "rticles")

# utils for post processing tex files

post_process_authors <- function(text) {

  # ---
  # correct authors field to have pattern Author 1, Author 2 and Author 3
  # ---
  authors_lines_start <- grep("^\\\\author\\{", text)
  # if no author line do nothing
  if (length(authors_lines_start) == 0L) return(text)
  # if multiple author line, do nothing and warn as it is unusual
  if (length(authors_lines_start) > 1L) {
    warning(
      "There should be only one use of `\\author{}` in the tex file. ",
      "Post processing `\\author{}` is cancelled.",
      call. = FALSE)
    return(text)
  }
  # find the authors lines range
  authors_lines_end <- grep("\\}$", text[seq(authors_lines_start, length(text))])[1]
  authors_lines_end <- authors_lines_end + (authors_lines_start - 1)
  authors_lines_range <- seq(authors_lines_start, authors_lines_end)
  # combine and write back
  authors_lines <- paste0(text[authors_lines_range], collapse = "\n")
  new_authors <- knitr::combine_words(strsplit(authors_lines, split = ", ")[[1]])
  text[authors_lines_range] <- xfun::split_lines(new_authors)
  # return modified text
  text
}

find_resource <- function(template, file = 'template.tex') {
  res <- system.file(
    "rmarkdown", "templates", template, "resources", file, package = "rticles"
  )
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

#' List available journals
#'
#' List available journal names in this package.
#'
#' These names can be useful in two ways:
#'
#' * You can add `_article` suffix to get the name of the output format (e.g.,
#' [rjournal_article()]).
#'
#' * You can use the name directly in the `template` argument of
#' [rmarkdown::draft()].
#' @return A character vector of the journal names.
#' @export
#' @md
#' @examples
#' rticles::journals()
journals <- function() {
  sort(dir(pkg_file_template()))
}

find_resource <- function(template, file = "template.tex") {
  res <- pkg_file_template(template, "resources", file)
  if (res == "") {
    stop(
      "Couldn't find template file ", template, "/resources/", file,
      call. = FALSE
    )
  }
  res
}

knitr_fun <- function(name) utils::getFromNamespace(name, "knitr")

output_asis <- knitr_fun("output_asis")

merge_list <- function(x, y) {
  fun <- knitr_fun("merge_list")
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
#'   rticles:::find_resource("rjournal", "RJwrapper.tex"),
#'   tempfile()
#' )
#' if (interactive()) file.show(x)
#' @noRd
template_pandoc <- function(metadata, template, output,
                            in_header = NULL, verbose = FALSE) {
  tmp <- tempfile(fileext = ".md")
  on.exit(unlink(tmp), add = TRUE)
  xfun::write_utf8(c("---", yaml::as.yaml(metadata), "---\n"), tmp)

  rmarkdown::pandoc_convert(
    tmp,
    output = output, verbose = verbose, wd = ".",
    options = c(
      "--template", rmarkdown::pandoc_path_arg(template),
      rmarkdown::pandoc_include_args(in_header)
    )
  )
  invisible(output)
}

# Helper function to create a custom format derived from pdf_document that
# includes a custom LaTeX template
pdf_document_format <- function(format,
                                template = find_resource(format, "template.tex"),
                                ...) {
  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"
  fmt
}

# recursion into a list to get an element using a vector of names
get_list_element <- function(x, names) {
  n <- length(names)
  if (!is.list(x) || n == 0) {
    return()
  }
  for (i in names[seq_len(n - 1)]) if (!is.list(x <- x[[i]])) {
    return()
  }
  x[[names[n]]]
}

pkg_file <- function(...) system.file(..., package = "rticles")

pkg_file_template <- function(...) pkg_file("rmarkdown", "templates", ...)

# utils for post processing tex files

# correct authors field to the form "Author 1, Author 2, and Author 3"
post_process_authors <- function(text) {
  i1 <- grep("^\\\\author\\{", text)
  # if no author line do nothing
  if (length(i1) == 0L) {
    return(text)
  }
  # if multiple author line, do nothing and warn as it is unusual
  if (length(i1) > 1L) {
    warning(
      "There should be only one instance of '\\author{}' in the tex file. ",
      "Post-processing \\author{} is cancelled.",
      call. = FALSE
    )
    return(text)
  }
  i2 <- grep("\\}$", text)
  i2 <- i2[i2 >= i1][1] # the first line that ends with } after \author{
  i <- i1:i2 # the authors lines range
  # combine and write back
  x1 <- paste0(text[i], collapse = "\n")
  x2 <- knitr::combine_words(strsplit(x1, split = ", ")[[1]])
  text[i] <- xfun::split_lines(x2)
  # return modified text
  text
}


# render a skeleton in a temp directory
render_draft <- function(journal, output_options = NULL, quiet = FALSE) {
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)
  # create a draft of the format
  doc <- paste0(journal, "_article", ".Rmd")
  rmarkdown::draft(doc, template = journal, package = "rticles", create_dir = FALSE, edit = FALSE)
  # render the file in the temp dir
  message(
    "Rendering the ", journal, " format...",
    if (!is.null(output_options)) " (with output options)"
  )
  output_file <- xfun::Rscript_call(
    fun = rmarkdown::render,
    args = list(doc, output_options = output_options, quiet = quiet)
  )
}

# Use to create variables command for Pandoc from a named vector
vec_to_pandoc_variable_args <- function(v_args) {
  # Convert to pandoc arguments
  pandoc_arg_list <- mapply(
    rmarkdown::pandoc_variable_arg,
    names(v_args),
    v_args,
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )
  unlist(pandoc_arg_list)
}

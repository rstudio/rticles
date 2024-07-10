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
list_to_pandoc_variable_args <- function(v_args) {
  # v_args must be named
  # stopifnot(length(names(v_args) > 0)

  truthy <- which(sapply(v_args, isTRUE))
  truthy_arg <- NULL
  if (length(truthy) > 0) {
    truthy_arg <- mapply(
      rmarkdown::pandoc_variable_arg,
      names(v_args[truthy]),
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE
    )
    v_args <- v_args[-truthy]
  }

  # remove named args which are false
  falsy <- sapply(v_args, isFALSE)
  if (any(falsy)) {
    v_args <- v_args[-which(falsy)]
  }

  # Convert to pandoc arguments
  pandoc_arg_list <-  c(
    mapply(
      rmarkdown::pandoc_variable_arg,
      names(v_args),
      v_args,
      SIMPLIFY = FALSE,
      USE.NAMES = FALSE
    ),
    truthy_arg
  )
  unlist(pandoc_arg_list)
}

## takes a character string with names separated by comma (e.g. journal's names)
## and turns them into a table

#' Split character string into table
#'
#' It takes a character string with names separated by comma (e.g. journal's names)
#' and turns them into a table
#'
#' If the number of elements can't be split equally in the `n` column, blank
#' cells will be created and all placed in the last column.
#'
#' @param x string to split and convert to table
#' @param n number of bucket to create. It will be the number of column in the
#'   resulting data.frame
#' @param split_regex defaults to `, ?`. Pass to `split` in [base::strsplit()].
#'
#' @return a dataframe of `n` columns
#' @export
#'
#' @examples
#' string_to_table(paste(letters, collapse = ", "), 3)
string_to_table <- function(x, n, split_regex = ", ?") {
  vec <- unlist(strsplit(x, split_regex))
  vec_list <- split(vec, cut(seq_along(vec), n, labels = FALSE))
  max_n <- max(unlist(lapply(vec_list, length)))
  # fill with NA
  for (i in 1:n) {
    # resize bucket
    length(vec_list[[i]]) <- max_n
    # and move empty spot at the end
    if (i != n && any(ii  <- is.na(vec_list[[i]]))) {
      vec_list[[i]][ii] <- vec_list[[i + 1]][seq_along(which(ii))]
      vec_list[[i + 1]] <- vec_list[[i + 1]][-seq_along(which(ii))]
    }
  }
  df <- data.frame(vec_list)
  df[is.na(df)] <- ""
  df
}

# Helper function to create a custom format derived from pdf_document that
# includes a custom LaTeX template
pdf_document_format <- function(format,
                                template = find_resource(format, "template.tex"),
                                ...) {

  fmt <- rmarkdown::pdf_document(..., template = template)
  fmt$inherits <- "pdf_document"

  ## Set some variables to adapt template based on Pandoc version
  args <- list_to_pandoc_variable_args(list(
    pandoc3 = rmarkdown::pandoc_available("3"),
    pandoc317 = rmarkdown::pandoc_available("3.1.7"), # new citeproc command
    pandoc318 = rmarkdown::pandoc_available("3.1.8") # revised citeproc command
  ))
  fmt$pandoc$args <- c(fmt$pandoc$args, args)
  fmt
}


is_citeproc_pandoc_args <- function(args) {
  "--citeproc" %in% args || "--natbib" %notin% args || "--biblatex" %notin% args
}

`%notin%` <- Negate(`%in%`)

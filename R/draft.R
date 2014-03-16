
#' @export
draft <- function(file, template, edit = TRUE) {

  # add Rmd extension if necessary
  if (!identical(tools::file_ext(file), "Rmd"))
    file <- paste(file, "Rmd", sep=".")

  # copy all of the files in the skeleton directory
  dir <- dirname(file)
  file.copy(list.files(find_file(template, "skeleton"), full.names = TRUE),
            to = dir)

  # rename the skeleton
  file.rename(file.path(dir, "skeleton.Rmd"), file)

  # invoke the editor if requested
  if (edit)
    file.edit(file)

  # return the name of the file created
  invisible(file)
}

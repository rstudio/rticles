
#' @export
new_article <- function(file, format, edit = TRUE) {
  
  # add Rmd extension
  if (!identical(tools::file_ext(file), "Rmd"))
    file <- paste(file, "Rmd", sep=".")
  
  # copy other files
  dir <- dirname(file)
  
  # copy all of the files in the skeleton directory
  file.copy(list.files(system.file(file.path("rmarkdown", format, "skeleton"),
                                   package = "rticles"),
                       full.names = TRUE),
            to = dir)
  
  # rename the skeleton
  file.rename(file.path(dir, "skeleton.Rmd"), file)
  
  # invoke the editor if requested
  if (edit)
    file.edit(file)
  
  # return the name of the file created
  invisible(file)
} 

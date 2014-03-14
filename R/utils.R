find_file <- function(template, file) {
  template <- system.file("rmarkdown", template, file, package = "rticles")
  if (template == "") {
    stop("Couldn't find template file ", template, "/", file, call = FALSE)
  }

  template
}

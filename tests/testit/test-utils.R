assert("last author is prepend with and ", {
  # if no author line, unmodified
  unmodified <- c("No author line", "returns unmodified")
  (post_process_authors(unmodified) %==% unmodified)

  # one author is unchanged
  (post_process_authors("\\author{John Doe}") %==%
    "\\author{John Doe}")

  # when 2 or more, add a 'and'
  (post_process_authors(c("\\title{title}", "\\author{John, Bob}")) %==%
    c("\\title{title}", "\\author{John and Bob}"))
  (post_process_authors("\\author{John, Bob, Mary}") %==%
    "\\author{John, Bob, and Mary}")

  # Works also if authors on 2 or more lines in the tex file
  (post_process_authors(
    c("\\author{John, Bob,", "Mary, Dany}", "\\abstract{text}")
  ) %==%
    c("\\author{John, Bob,", "Mary, and Dany}", "\\abstract{text}"))
  (post_process_authors(
    c("\\title{title}", "\\author{John, Bob,", "Lucy, Ann,", "Mary, Dany}")
  ) %==%
    c("\\title{title}", "\\author{John, Bob,", "Lucy, Ann,", "Mary, and Dany}"))

  # handles the weird case where two or more \\authors are used in the document
  unmodified <- c("\\author{John, Bob}", "some text", "\\author{Mary, Dany}")
  (suppressWarnings(post_process_authors(unmodified)) %==% unmodified)
})

assert("all journals are listed and have a template folder", {
  all <- grep("_article$", getNamespaceExports("rticles"), value = TRUE)
  all <- gsub("_article$", "", all)
  folder_name <- journals()
  # Special case for format function handling several version of template
  folder_name <- unique(gsub("^([^_]+)_.*$", "\\1", folder_name))
  (folder_name %==% sort(all))
})

assert("Named vector is transformed to pandoc variable args", {
  (vec_to_pandoc_variable_args(c(a = "b")) %==%
    c(rmarkdown::pandoc_variable_arg("a", "b"))
  )
  (vec_to_pandoc_variable_args(c(a = "b", c = "d")) %==%
    c(
      rmarkdown::pandoc_variable_arg("a", "b"),
      rmarkdown::pandoc_variable_arg("c", "d")
    )
  )
})

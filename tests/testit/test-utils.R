assert("last author is prepend with and ", {
  (post_process_authors(c("\\title{title}", "\\author{John, Bob}")) %==%
     c("\\title{title}", "\\author{John and Bob}"))
  (post_process_authors("\\author{John, Bob, Mary}") %==%
      "\\author{John, Bob, and Mary}")
  unmodified <- c("No author line", "returns unmodified")
  (post_process_authors(unmodified) %==% unmodified)
})

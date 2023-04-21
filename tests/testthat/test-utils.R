test_that("vec_to_table split using default separator", {
  x <- paste(letters, collapse = ", ")
  df <- vec_to_table(x, 3)
  df_target <-
    structure(list(
      X1 = c("a", "b", "c", "d", "e", "f", "g", "h",
             "i"),
      X2 = c("j", "k", "l", "m", "n", "o", "p", "q", "r"),
      X3 = c("s",
             "t", "u", "v", "w", "x", "y", "z", "")
    ),
    row.names = c(NA, -9L),
    class = "data.frame")
  expect_identical(df, df_target)
})

test_that("vec_to_table split using custom separator", {
  x <- paste(letters, collapse = "#")
  df <- vec_to_table(x, 3, "#")
  df_target <-
    structure(list(
      X1 = c("a", "b", "c", "d", "e", "f", "g", "h",
             "i"),
      X2 = c("j", "k", "l", "m", "n", "o", "p", "q", "r"),
      X3 = c("s",
             "t", "u", "v", "w", "x", "y", "z", "")
    ),
    row.names = c(NA, -9L),
    class = "data.frame")
  expect_identical(df, df_target)
})

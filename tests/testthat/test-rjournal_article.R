test_that("rjournal_article() is defunct", {
  expect_snapshot({
    x <- rjournal_article()
  }, error = TRUE)
})

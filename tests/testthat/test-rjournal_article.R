test_that("rjournal_article() is deprecated", {
  expect_snapshot({
    x <- rjournal_article()
  })
})

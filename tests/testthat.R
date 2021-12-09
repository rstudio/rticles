if (!xfun::pkg_available("testthat", "3.0.0")) return()

library(testthat)
library(rticles)

test_check("rticles")

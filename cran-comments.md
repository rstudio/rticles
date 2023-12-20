## R CMD check results

We checked 16 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 1 new problems
 * We failed to check 0 packages

Issues with CRAN packages are summarised below.

### New problems
(This reports the first line of each new failure)

* markovchain
  checking re-building of vignette outputs ... ERROR
  
  This is on system with Pandoc < 2.7 due to new requirement from one of the output format. 

  An issue has been raised upstream: https://github.com/spedygiorgio/markovchain/issues/219
  
  On system with latest Pandoc, there should be no error.

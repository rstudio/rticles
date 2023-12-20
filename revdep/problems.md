# markovchain

<details>

* Version: 0.9.5
* GitHub: https://github.com/spedygiorgio/markovchain
* Source code: https://github.com/cran/markovchain
* Date/Publication: 2023-09-24 09:20:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "markovchain")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘an_introduction_to_markovchain_package.Rmd’ using rmarkdown
    Error: processing vignette 'an_introduction_to_markovchain_package.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘an_introduction_to_markovchain_package.Rmd’
    
    --- re-building ‘gsoc_2017_additions.Rmd’ using rmarkdown
    
    tlmgr: Remote database (rev 69165) seems to be older than local (rev 69167 of texlive-scripts); please use different mirror or  wait a day or so.
    tlmgr update --self
    ...
    Error: processing vignette 'higher_order_markov_chains.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘higher_order_markov_chains.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘an_introduction_to_markovchain_package.Rmd’
      ‘higher_order_markov_chains.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘an_introduction_to_markovchain_package.Rmd’ using rmarkdown
    Error: processing vignette 'an_introduction_to_markovchain_package.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘an_introduction_to_markovchain_package.Rmd’
    
    --- re-building ‘gsoc_2017_additions.Rmd’ using rmarkdown
    
    tlmgr: Remote database (rev 69165) seems to be older than local (rev 69167 of texlive-scripts); please use different mirror or  wait a day or so.
    Warning in system2("tlmgr", args, ...) :
    ...
    Error: processing vignette 'higher_order_markov_chains.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘higher_order_markov_chains.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘an_introduction_to_markovchain_package.Rmd’
      ‘gsoc_2017_additions.Rmd’ ‘higher_order_markov_chains.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking package dependencies ... NOTE
    ```
    Package which this enhances but not available for checking: ‘etm’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 24.0Mb
      sub-directories of 1Mb or more:
        libs  21.9Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```


# fairadapt

<details>

* Version: 0.2.5
* GitHub: https://github.com/dplecko/fairadapt
* Source code: https://github.com/cran/fairadapt
* Date/Publication: 2023-03-23 15:02:04 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::cloud_details(, "fairadapt")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘jss.Rmd’ using rmarkdown
    Error: processing vignette 'jss.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘jss.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘jss.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘jss.Rmd’ using rmarkdown
    This is pdfTeX, Version 3.141592653-2.6-1.40.24 (TeX Live 2022) (preloaded format=pdflatex)
     restricted \write18 enabled.
    entering extended mode
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    tlmgr search --file --global '/standalone.cls'
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
    ...
    Quitting from lines 154-232 (jss.Rmd) 
    Error: processing vignette 'jss.Rmd' failed with diagnostics:
    LaTeX failed to compile tikz26b778dbad14.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See tikz26b778dbad14.log for more info.
    --- failed re-building ‘jss.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘jss.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# forecast

<details>

* Version: 8.21
* GitHub: https://github.com/robjhyndman/forecast
* Source code: https://github.com/cran/forecast
* Date/Publication: 2023-02-27 22:02:28 UTC
* Number of recursive dependencies: 85

Run `revdepcheck::cloud_details(, "forecast")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘JSS2008.Rmd’ using rmarkdown
    Error: processing vignette 'JSS2008.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘JSS2008.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘JSS2008.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘JSS2008.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'JSS2008.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/forecast/old/forecast.Rcheck/vign_test/forecast/vignettes/JSS2008.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See JSS2008.log for more info.
    --- failed re-building ‘JSS2008.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘JSS2008.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        libs   7.8Mb
    ```

# multgee

<details>

* Version: 1.8.0
* GitHub: https://github.com/AnestisTouloumis/multgee
* Source code: https://github.com/cran/multgee
* Date/Publication: 2021-05-13 17:40:02 UTC
* Number of recursive dependencies: 42

Run `revdepcheck::cloud_details(, "multgee")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘multgee_vignette.Rmd’ using rmarkdown
    Error: processing vignette 'multgee_vignette.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘multgee_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘multgee_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘multgee_vignette.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'multgee_vignette.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/multgee/old/multgee.Rcheck/vign_test/multgee/vignettes/multgee_vignette.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See multgee_vignette.log for more info.
    --- failed re-building ‘multgee_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘multgee_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# RGCCA

<details>

* Version: 3.0.0
* GitHub: https://github.com/rgcca-factory/RGCCA
* Source code: https://github.com/cran/RGCCA
* Date/Publication: 2023-04-27 09:32:34 UTC
* Number of recursive dependencies: 187

Run `revdepcheck::cloud_details(, "RGCCA")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘RGCCA.Rmd’ using rmarkdown
    Error: processing vignette 'RGCCA.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘RGCCA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘RGCCA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘RGCCA.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
    ...
    
    Error: processing vignette 'RGCCA.Rmd' failed with diagnostics:
    LaTeX failed to compile /tmp/workdir/RGCCA/old/RGCCA.Rcheck/vign_test/RGCCA/vignettes/RGCCA.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See RGCCA.log for more info.
    --- failed re-building ‘RGCCA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘RGCCA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ricu

<details>

* Version: 0.5.5
* GitHub: https://github.com/eth-mds/ricu
* Source code: https://github.com/cran/ricu
* Date/Publication: 2023-04-09 13:50:02 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::cloud_details(, "ricu")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ricu.Rmd’ using rmarkdown
    Error: processing vignette 'ricu.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘ricu.Rmd’
    
    --- re-building ‘start.Rmd’ using rmarkdown
    --- finished re-building ‘start.Rmd’
    
    --- re-building ‘uom.Rmd’ using rmarkdown
    --- finished re-building ‘uom.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ricu.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘ricu.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    See https://tug.org/texlive/upgrade.html for details.
    Warning in system2("tlmgr", args, ...) :
      running command ''tlmgr' search --file --global '/standalone.cls'' had status 1
    ...
    --- finished re-building ‘start.Rmd’
    
    --- re-building ‘uom.Rmd’ using rmarkdown
    --- finished re-building ‘uom.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ricu.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# simmer

<details>

* Version: 4.4.5
* GitHub: https://github.com/r-simmer/simmer
* Source code: https://github.com/cran/simmer
* Date/Publication: 2022-06-25 21:00:02 UTC
* Number of recursive dependencies: 94

Run `revdepcheck::cloud_details(, "simmer")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘simmer-01-introduction.Rmd’ using rmarkdown
    --- finished re-building ‘simmer-01-introduction.Rmd’
    
    --- re-building ‘simmer-02-jss.Rmd’ using rmarkdown
    Error: processing vignette 'simmer-02-jss.Rmd' failed with diagnostics:
    pandoc version 2.7 or higher is required and was not found (see the help page ?rmarkdown::pandoc_available).
    --- failed re-building ‘simmer-02-jss.Rmd’
    
    --- re-building ‘simmer-03-trajectories.Rmd’ using rmarkdown
    ...
    --- finished re-building ‘simmer-08-philosophers.Rmd’
    
    --- re-building ‘simmer-aa-5G.Rmd’ using rmarkdown
    --- finished re-building ‘simmer-aa-5G.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘simmer-02-jss.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## Newly fixed

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘simmer-01-introduction.Rmd’ using rmarkdown
    --- finished re-building ‘simmer-01-introduction.Rmd’
    
    --- re-building ‘simmer-02-jss.Rmd’ using rmarkdown
    A new version of TeX Live has been released. If you need to install or update any LaTeX packages, you have to upgrade TinyTeX with tinytex::reinstall_tinytex(repository = "illinois").
    
    tlmgr: Local TeX Live (2022) is older than remote repository (2023).
    Cross release updates are only supported with
      update-tlmgr-latest(.sh/.exe) --update
    ...
    --- finished re-building ‘simmer-08-philosophers.Rmd’
    
    --- re-building ‘simmer-aa-5G.Rmd’ using rmarkdown
    --- finished re-building ‘simmer-aa-5G.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘simmer-02-jss.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 28.9Mb
      sub-directories of 1Mb or more:
        doc    1.7Mb
        libs  26.6Mb
    ```


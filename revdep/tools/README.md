# Script that helps me with revdepcheck

## Getting setup 

Download the scripts 

```r
get_gist <- function(where = "revdep/tools") {
  gist_id <- "7018c926b14ec45d1a34e70e018db2d5"
  fs::dir_create(where)
  gistr::gist_save(glue::glue("https://gist.github.com/cderv/{gist_id}"), where)
  files <- fs::dir_ls(glue::glue("{where}/{gist_id}"))
  for (f in files) {
    new <- fs::path(where, fs::path_file(f))
    if (fs::file_exists(new)) {
      cli::cli_alert_danger("File {.file {new}} already exists")
      next
    }
    fs::file_copy(f, where)
  }
  fs::dir_delete(glue::glue("{where}/{gist_id}"))
  cli::cli_alert_warning(cli::col_br_red("Fill in cloud URL and Job id"))
  return(fs::dir_ls(where))
}

get_gist()
```

Don't 

## Scripts

* `checkerrors.R` will help analyze the installation log
* `revdepcheck.R` will help run a local revdepchek on a subset of dependencies
* `utils.R` will help retrieve some information about the cloud revdep

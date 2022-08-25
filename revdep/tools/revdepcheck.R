## Manually run a revdep check for a subset of package ------------

# Initialize package and DB
pkg <- revdepcheck:::pkg_check(".")
revdepcheck:::db_setup(pkg)
db <- revdepcheck:::db(pkg)
DBI::dbListTables(db)

# Check todo - Should be empty or done
revdepcheck::revdep_todo()

# Add package to check
to_run <- c("EpiNow2","OncoBayes2","Sleuth3","bain","breathteststan","clustermq","insight","parameters","personalized")
revdepcheck::revdep_add(packages = to_run)
# Add one other package
revdepcheck::revdep_add(packages = "intkrige")
# Remove a package
revdepcheck::revdep_rm(packages = "bain")

# Check to run
revdepcheck::revdep_todo()

# Set repo to RSPM
options(repos = c(CRAN = "https://packagemanager.rstudio.com/cran/__linux__/focal/latest"))

# Run check
revdepcheck::revdep_check(timeout = as.difftime(5, units = "hours"), num_workers = 1)


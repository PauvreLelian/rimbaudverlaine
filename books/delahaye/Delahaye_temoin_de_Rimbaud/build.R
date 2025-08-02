# build.R
#bookdown::render_book("index.Rmd", "bookdown::gitbook")

#!/usr/bin/env Rscript

# Ensure bookdown is loaded
if (!requireNamespace("bookdown", quietly = TRUE)) {
  stop("The 'bookdown' package is required but not installed.")
}

# Render the book
bookdown::render_book("index.Rmd", "bookdown::gitbook")

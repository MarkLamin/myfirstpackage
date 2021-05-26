
# myfirstpackage

<!-- badges: start -->
[![R-CMD-check](https://github.com/MarkLamin/myfirstpackage/workflows/R-CMD-check/badge.svg)](https://github.com/MarkLamin/myfirstpackage/actions)
[![codecov](https://codecov.io/gh/MarkLamin/myfirstpackage/branch/master/graph/badge.svg?token=EBUIPEO7C1)](https://codecov.io/gh/MarkLamin/myfirstpackage)
<!-- badges: end -->

The goal of myfirstpackage is to ...

## Installation

You can install the package using GitHub :

``` r
devtools::install_github("https://github.com/MarkLamin/myfirstpackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(myfirstpackage)
## basic example code
```
```{r}
To view the vignette:
devtools::install_github("bryandmartin/Demo", build_vignette = TRUE, build_opts = c())
library(Demo)
# Use this to view the vignette in the Demo HTML help
help(package = "Demo", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "Demo")
```


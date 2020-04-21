
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datavyu

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/datavyu)](https://CRAN.R-project.org/package=datavyu)
<!-- badges: end -->

The goal of {datavyu} is to to to facilitate the use of the open-source
**datavyu** software for the analysis of qualitative audiovisual data

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jrosen48/datavyu")
```

The datavyu software must also be installed; see
[here](https://datavyu.org/download.html)

## Use

*note*: The use of this package requires the use of the **datavyu**
software’s [Ruby API](https://datavyu.org/user-guide/api.html); note
that while **datavyu** has a graphical user interface, it is accompanied
by a number of Ruby scripts.

1.  . Run the following Ruby script within the datavyu software; select
    a directory with one or more `.opf` files:

`csv2opf.rb`

2.  Open the directory that the Ruby script created; a number of CSV
    files for each `.opf` file should now be created.

3.  These CSV files can be loaded like any others (and can be opened in
    Excel); within R, they can easily be used for visualizations, like
    the following, which was created with the [test.R](R/test.R) file:

![example image](readme-img.png)

Ideally, this kind of plot would be created using an arbitrary number of
files with a command such as:

`plot_ts()` (for ‘plot time series’)

## Other packages

We note that there is another R package that provides an interface to
**datavyu;** that package is
[{datavyur}](https://github.com/iamamutt/datavyu).

At this time, we are using this package in an experimental sense, and
recommend those looking for a more-developed package consider using
{datavyur} instead of this package.

## Questions/to do

### Necessary to address

  - what is the core functionality of the package?
  - what problems exist where it comes to using data created in datavyu,
    and how can this package speak to those problems?

## Maybe worth addressing

  - running the Ruby script from within R
  - setting up templates/importing data

## Probably out of scope

  - interacting directly with datavyu, given the Ruby API (and the
    challenge of running Ruby code from within R)

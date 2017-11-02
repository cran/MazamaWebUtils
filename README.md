<!-- [![Build Status](https://travis-ci.org/mazamascience/MazamaWebUtils.svg)](https://travis-ci.org/mazamascience/MazamaWebUtils) -->
<!-- [![Coverage Status](https://coveralls.io/repos/mazamascience/MazamaWebUtils/badge.svg?branch=master&service=github)](https://coveralls.io/github/mazamascience/MazamaWebUtils?branch=master) -->
<!-- [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/MazamaWebUtils)](https://cran.r-project.org/package=MazamaWebUtils) -->
<!-- [![Downloads](http://cranlogs.r-pkg.org/badges/MazamaWebUtils)](https://cran.r-project.org/package=MazamaWebUtils) -->

# MazamaWebUtils

```
A suite of utility functions providing standardized functionality
often needed in web services including: logging, cache management
and parsing of http request headers.
```

## Background

The MazamaWebUtils package was created by MazamaScience to regularize our
work building web services on top of R scripts.

The main goal of this package is to create an internally standardized set of
functions that we can use in various web-data projects. Areas of functionality
supported by this package include:

 * python style logging
 * cache management
 * CGI request parsing
 * generation of HTTP response headers
 
 
## Installation

Users will want to install the **devtools** package to have access to latest versions 
of some packages that are not yet available on CRAN.

The following packages should be installed with devtools by typing the following at the RStudio console:

``` devtools::install_github('mazamascience/MazamaWebUtils') ```


----

This project is supported by Mazama Science.



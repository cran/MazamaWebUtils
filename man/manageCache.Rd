% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cacheManagement.R
\name{manageCache}
\alias{manageCache}
\title{Manage the Size of a Cache}
\usage{
manageCache(cacheDir, extensions = c("html", "json", "pdf", "png"),
  maxCacheSize = 100)
}
\arguments{
\item{cacheDir}{location of cache directory}

\item{extensions}{vector of file extensions eligible for removal}

\item{maxCacheSize}{maximum cache size in megabytes}
}
\value{
Invisibly returns the number of files removed.
}
\description{
If \code{cacheDir} takes up more than \code{maxCacheSize}
megabytes on disk, files wll be removed in order of oldest access time. Only
files matching \code{extensions} are eligible for removal.
}
\examples{
# Create a cache directory and fill it with 1.6 MB of data
CACHE_DIR <- tempdir()
write.csv(matrix(1,400,500), file=file.path(CACHE_DIR,'m1.csv'))
write.csv(matrix(2,400,500), file=file.path(CACHE_DIR,'m2.csv'))
write.csv(matrix(3,400,500), file=file.path(CACHE_DIR,'m3.csv'))
write.csv(matrix(4,400,500), file=file.path(CACHE_DIR,'m4.csv'))
for (file in list.files(CACHE_DIR, full.names=TRUE)) {
  print(file.info(file)[,c(1,6)])
}
# Remove files based on last access time until we get under 1 MB
manageCache(CACHE_DIR, extensions='csv', maxCacheSize=1)
for (file in list.files(CACHE_DIR, full.names=TRUE)) {
  print(file.info(file)[,c(1,6)])
}
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flatten.R
\name{str_flatten}
\alias{str_flatten}
\title{Flatten a string}
\usage{
str_flatten(string, collapse = "", last = NULL)
}
\arguments{
\item{string}{\verb{character vector} to flatten.}

\item{collapse}{\code{string} to insert between each element.}

\item{last}{(Optional) \code{string} use in place of final separator.}
}
\value{
Returns a \verb{character vector} of length 1
}
\description{
This is a summary function for strings: regardless of the
length of the input, it always returns a single string.
}
\examples{
str_flatten(letters)
str_flatten(letters, "-")

str_flatten(letters[1:5], ", ", ", and ")
str_flatten(letters[1:3], ", ", ", and ")
str_flatten(letters[1:2], ", ", ", and ")
str_flatten(letters[1], ", ", ", and ")
str_flatten(letters[0], ", ", ", and ")
}

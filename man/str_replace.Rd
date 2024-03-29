% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replace.R
\name{str_replace}
\alias{str_replace}
\alias{str_replace_all}
\title{Replace matched patterns in a string}
\usage{
str_replace(string, pattern, replacement)

str_replace_all(string, pattern, replacement)
}
\arguments{
\item{string}{\verb{character vector} of strings.}

\item{pattern}{\code{string} or \verb{character vector}, pattern(s) to match. Can be:
\itemize{
\item A Perl-compatible regular expression (default).
\item Wrap with \code{perl(ignore_case = TRUE)} to use case-insensitive matching.
\item Wrap with \code{fixed()} to use a fixed/literal match.
\item Wrap with \code{regex()} to use a POSIX 1003.2 extended regular expression.
\item Wrap with \code{regex(ignore_case = TRUE)} to use case-insensitive matching with
a POSIX 1003.2 extended regular expression.
\item A \strong{named} \verb{character vector} (see description in argument below)
\item To perform multiple replacements in each element of \code{string}, use a
named \verb{character vector} in the format: \code{c("pattern1" = "replacement1")}
}}

\item{replacement}{\code{string} or \verb{character vector} of replacements.
\itemize{
\item Should be either of length one or the same length as \code{string} or \code{pattern}.
\item Can also be a function (or formula) which will be called once for each
match (from right to left) and its return value will be used to replace
the match. Due to limitation with base R, a \strong{warning} is produced if
the return value is longer than the match.
\item References of the form \verb{\\1}, \verb{\\2}, etc will be replaced with
the contents of the respective matched group (created by \verb{()}).
\item To perform multiple replacements in each element of \code{string}, leave
use a named \verb{character vector} for \code{pattern} in the format:
\code{c("pattern1" = "replacement1")}.
\item To replace the complete string with \code{NA}, use \code{replacement = NA_character_}.
}}
}
\value{
Returns a \verb{character vector}.
}
\description{
Vectorised over \code{string}, \code{pattern} and \code{replacement}.
}
\examples{
fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")
str_replace_all(fruits, "[aeiou]", "-")
str_replace_all(fruits, "b", NA_character_)

str_replace(fruits, "([aeiou])", "")
str_replace(fruits, "([aeiou])", "\\\\1\\\\1")

# Note that str_replace() is vectorised along text, pattern, and replacement
str_replace(fruits, "[aeiou]", c("1", "2", "3"))
str_replace(fruits, c("a", "e", "i"), "-")

# If you want to apply multiple patterns and replacements to the same
# string, pass a named vector to pattern.
fruits2 <- "one apple---two pears---three bananas"
str_replace_all(fruits2, c("one" = "1", "two" = "2", "three" = "3"))

# Use a function for more sophisticated replacement. This example converts
# all vowels into upper case.
str_replace_all(fruits, "[aeiou]", toupper)

# If the function used for replacement outputs a longer string than the match
# it will replace, a warning is produced. This example tries to replace
# colour names with their hex values, which works with stringr but not with
# this package unfortunately.
colours <- str_c("\\\\b", colors(), "\\\\b", collapse="|")
col2hex <- function(col) {
  rgb <- col2rgb(col)
  rgb(rgb["red", ], rgb["green", ], rgb["blue", ], max = 255)
}

x <- c(
  "Roses are red, violets are blue",
  "My favourite colour is green"
)
\dontrun{str_replace_all(x, colours, col2hex)} # produces warnings
}
\seealso{
\code{str_replace_na()} to turn missing values into \code{NA}.
}

\name{mnl.spec}
\Rdversion{1.1}
\alias{mnl.spec}

\title{
Specification Object of a Multinomial Logit Model 
}
\description{
Using a formula and data, create a specification object of a multinomial logit model.
}
\usage{
mnl.spec(f, data, choices = NULL, base.choice = 1, 
         varying = NULL, sep = ".")
}
\arguments{
  \item{f}{Formula (see Details below).}
  \item{data}{Data frame containing the variables in the model. It should be in the \sQuote{wide} format (using the terminology of the \code{\link{reshape}} function), i.e. there is one record for each individual and alternative-specific variables occupy single column per alternative.}
  \item{choices}{Vector of names of alternatives. If it is not given, it is determined from the response column of the data frame. Values of this vector should match or be a subset of those in the response column.}
  \item{base.choice}{Index of the base alternative within the vector \code{choices}.}
  \item{varying}{Indices of variables within \code{data} that are alternative-specific.}
  \item{sep}{Separator of variable name and alternative name in the \sQuote{varying} variables.}
}
\details{
The formula \code{f} is of the form \code{response ~ x1 + x2 | y1 + y2}. Coefficients for variables in the first part of the formula (i.e. before '|'), here \code{x1} and \code{x2}, are forced to be the same for all alternatives. Variables in the second part of the formula (i.e. after '|'), here \code{y1} and \code{y2}, have different coefficients for different alternatives. Either part of the formula can be omitted. Alternative specific constants (asc) are included automatically. To exclude asc, use -1 in the first part. The equation of the base alternative is always set to 0.
}
\value{
An object of class \code{mnl.spec} containing the following elements:
\item{response}{Name of the response variable.}
\item{choices}{Vector of alternatives.}
\item{base.choice}{Index of the base alternative within \code{choices}.}
\item{variable.used}{Matrix of size number of choices x number of variables. Each value is logical determining if the variable is used in that choice equation.}
\item{same.coefs}{Logical vector of size number of variables. It determines if that variable has the same coefficient for all alternatives.}
\item{full.var.names}{Matrix of the same shape as \code{variable.used}. It contains names of variables in its alternative-specific form.}
\item{varying.names}{Vector of variable names specified by the \code{varying} vector that are used in the specification.}
\item{intercepts}{Logical vector of size number of choices determining in which equation asc is used.}
\item{sep}{Separator of variable name and alternative name in the \sQuote{varying} variables.}
\item{frequency}{Table of frequencies for each choice in the \code{choices} vector computed from the data.}
}

\author{
Hana Sevcikova
}

\seealso{
\code{\link{summary.mnl.spec}}
}
\examples{
data(heating)
spec <- mnl.spec(depvar ~ ic + oc + income, heating, varying=3:12, sep='')
summary(spec)
spec <- mnl.spec(depvar ~ oc-1 | ic, heating, varying=3:12, sep='')
summary(spec)
}

\keyword{ classes }
\keyword{ models }


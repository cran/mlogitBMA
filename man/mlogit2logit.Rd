\name{mlogit2logit}
\Rdversion{1.1}
\alias{mlogit2logit}

\title{
Converting Multinomial Logit Data into Binary Logit Data
}
\description{
Converts multinomial logit data into a combination of several binary logit data sets, in order to analyze it via the Begg & Gray approximation using a binary logistic regression.
}
\usage{
mlogit2logit(f, data, choices = NULL, base.choice = 1, 
             varying = NULL, sep = ".")
}
\arguments{
  \item{f}{Formula as described in Details of \code{\link{mnl.spec}}.}
  \item{data}{Data frame containing the variables of the model.}
  \item{choices}{Vector of names of alternatives. If it is not given, it is determined from the response column of the data frame. Values of this vector should match or be a subset of those in the response column. If it is a subset, \code{data} is reduced to contain only observations whose choice is contained in \code{choices}.}
  \item{base.choice}{Index of the base alternative within the vector \code{choices}.}
  \item{varying}{Indices of variables within \code{data} that are alternative-specific.}
  \item{sep}{Separator of variable name and alternative name in the \sQuote{varying} variables.}
}
\details{
	Details of the conversion algorithm are described in the vignette of this package, see \code{vignette('conversion')}.
}

\note{
This function is called from within the \code{\link{bic.mlogit}} and thus usually will not need to be called explicitly. 
}

\value{
List with components:
\item{data}{Converted data set.}
\item{formula}{Formula to be used with the converted data set.}
\item{nobs}{Number of observations in the original data set.}
\item{z.index}{Index of all \eqn{Z} columns within \code{data} (see vignette for details), i.e. columns that correspond to alternative specific constants.}
\item{z.names}{Names of the \eqn{Z} columns.}
\item{zcols}{List in which each element corresponds to any of the \code{data} columns that involve \eqn{Z}, which is either \eqn{Z} itself or an interaction between a variable and \eqn{Z}, (see vignette). The value of such element is a vector with the components \sQuote{name}: either \eqn{Z} itself, or name of the corresponding \eqn{X} or \eqn{U} variable with which \eqn{Z} interacts; \sQuote{choice}: which alternative it belongs to; \sQuote{intercept}: logical determining if it is an alternative specific constant.}
\item{choices}{Vector of names of the alternatives.}
\item{choice.main.intercept}{Index of alternative within \code{choices} that corresponds to the main intercept of the binary logistic model.}

}

\references{
Begg, C.B., Gray, R. (1984) Calculation of polychotomous logistic regression parameters using individualized regressions. Biometrika \bold{71}, 11--18.

Yeung, K.Y., Bumgarner, R.E., Raftery, A.E. (2005) Bayesian model averaging: development of an improved multi-class, gene selection and classification tool for microarray data. Bioinformatics \bold{21} (10), 2394--2402.
}
\author{
Hana Sevcikova
}
%\note{
%%  ~~further notes~~
%}

\seealso{
\code{\link{mnl.spec}}
}
\examples{
data(heating)
bin.data <- mlogit2logit(depvar ~ ic + oc, heating, choices=1:5, 
                         varying=3:12, sep='')
bin.glm <- glm(bin.data$formula, 'binomial', data=bin.data$data)
summary(bin.glm)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ manip }

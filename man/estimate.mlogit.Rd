\name{estimate.mlogit}
\Rdversion{1.1}
\alias{estimate.mlogit}
\alias{estimate.mlogit.formula}
\alias{estimate.mlogit.mnl.spec}
\alias{estimate.mlogit.bic.mlogit}
\alias{estimate.mlogit.list}
\alias{mnl}

\title{
Multinomial Logit Estimation
}
\description{
Maximum likelihood estimation of coefficients of one or more multinomial logit models.
}
\usage{
\method{estimate.mlogit}{formula} (f, data, method = "BHHH", 
                 choices = NULL, base.choice = 1, 
                 varying = NULL, sep = ".", ...)
	
\method{estimate.mlogit}{mnl.spec} (object, data, method='BHHH', ...)

\method{estimate.mlogit}{bic.mlogit} (object, ...)

\method{estimate.mlogit}{list} (object, data, verbose=TRUE, ...)
}

\arguments{
  \item{f}{Formula as described in Details of \code{\link{mnl.spec}}.}
  \item{object}{An object of class \code{\link{mnl.spec}} containing the model specification, or an object of class \code{\link{bic.mlogit}}, or a list of objects of class \code{\link{mnl.spec}}.}
  \item{data}{Data frame containing the variables of the model.}
  \item{method}{Estimation method passed to the \code{maxLik} function of the \pkg{maxLik} package. Available methods are \dQuote{Newton-Raphson}, \dQuote{BFGS}, \dQuote{BHHH}, \dQuote{SANN} or \dQuote{NM}. }
  \item{choices}{Vector of names of alternatives. If it is not given, it is determined from the response column of the data frame. Values of this vector should match or be a subset of those in the response column. If it is a subset, \code{data} is reduced to contain only observations whose choice is contained in \code{choices}.}
  \item{base.choice}{Index of the base alternative within the vector \code{choices}. }
  \item{varying}{Indices of variables within \code{data} that are alternative-specific.}
  \item{sep}{Separator of variable name and alternative name in the \sQuote{varying} variables.}
  \item{verbose}{Logical switching log messages on and off.}
  \item{\dots}{Arguments passed to the underlying optimization routine in \pkg{optim}. Note that arguments \code{data} and \code{method} can be also passed to \code{estimate.mlogit.bic.mlogit} and \code{estimate.mlogit.list}.}
}
\details{
The data are expected to be in the \sQuote{wide} format (using the terminology of the \code{\link{reshape}} function). There should be one record for each individual. Alternative-specific variables occupy single column per alternative.
The given optimization routine is called for the multinomial data, starting from the coefficients being all zeros.

Function \code{estimate.mlogit.bic.mlogit} invokes as many estimations as there are models selected in the \code{\link{bic.mlogit}} object. Function \code{estimate.mlogit.list} invokes an estimation for each specification included in the \code{object} argument.
}
\value{
	Functions \code{estimate.mlogit.formula} and \code{estimate.mlogit.mnl.spec} return an object of class \code{mnl}. Functions \code{estimate.mlogit.bic.mlogit} and \code{estimate.mlogit.list} return a list of such objects with each element corresponding to one specification. An object of class \code{mnl} contains the following components:
	\item{coefficients}{The estimated coefficients.}
  	\item{logLik}{Maximum log-likelihood.}
	\item{logLik0}{Null log-likelihood.}
	\item{aic}{Akaike Information Criterium.}
	\item{bic}{Bayesian Information Criterium.}
	\item{iter}{Number of iterations.}
	\item{hessian}{The Hessian at the maximum.}
	\item{gradient}{The last gradient value.}
	\item{fitted.values}{The MNL probabilities computed with the estimated parameters.}
	\item{residuals}{Difference between observed values and fitted values.}
	\item{specification}{The corresponding \code{\link{mnl.spec}} object.}
	\item{convergence}{Convergence statistics.}
	\item{method}{Estimation method.}
	\item{time}{Time needed for the estimation.}
	\item{code}{Code returned by the \code{\link[maxLik]{maxLik}} function.}
	\item{message}{Message describing the \code{code}.}
	\item{last.step}{List describing the last unsuccessful step if \code{code=3} (see \code{\link[maxLik]{maxLik}}).}
}
\references{
Train, K.E. (2003) Discrete Choice Methods with Simulation. Cambridge University Press.
}
\author{
Hana Sevcikova
}
%\note{
%%  ~~further notes~~
%}

\seealso{
\code{\link{summary.mnl}}, \code{\link{mnl.spec}}, \code{\link{reshape}}, \code{\link[maxLik]{maxLik}}
}
\examples{
data(heating)
est <- estimate.mlogit(depvar ~ ic + oc, heating, choices=1:5, 
                       varying=c(3:12, 20:24), sep='')
summary(est)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ optimize }
\keyword{ htest }
\keyword{ classes }

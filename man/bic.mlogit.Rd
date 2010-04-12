\name{bic.mlogit}
\Rdversion{1.1}
\alias{bic.mlogit}

\title{
Bayesian Model Averaging for Multinomial Logit Models
}
\description{
Using the methodology of Bayesian Model Averaging in the \pkg{BMA} package, the variable selection problem is applied to multinomial logit models in which coefficients can be estimated relative to a base alternative. 
}
\usage{
bic.mlogit(f, data, choices = NULL, base.choice = 1, 
           varying = NULL, sep = ".", approx=TRUE, 
           include.intercepts = TRUE, verbose = FALSE, ...)
}
\arguments{
  \item{f}{Formula as described in Details of \code{\link{mnl.spec}}.}
  \item{data}{Data frame containing the variables of the model. There should be one record for each individual. Alternative-specific variables occupy single column per alternative.}
  \item{choices}{Vector of names of alternatives. If it is not given, it is determined from the response column of the data frame. Values of this vector should match or be a subset of those in the response column. If it is a subset, \code{data} is reduced to contain only observations whose choice is contained in \code{choices}.}
  \item{base.choice}{Index of the base alternative within the vector \code{choices}.}
  \item{varying}{Indices of variables within \code{data} that are alternative-specific.}
  \item{sep}{Separator of variable name and alternative name in the \sQuote{varying} variables.}
  \item{approx}{Logical. If \code{TRUE}, the function uses approximate likelihoods as they come out of the Begg & Gray approximation. If \code{FALSE}, the MNL maximum likelihood estimation is used in the last step of the model selection procedure. Note that this can significantly increase the run-time, see Details below.}
  \item{include.intercepts}{Logical controlling if alternative specific constants should always be included in the selected models. It only has an effect if the formula \code{f} contains the intercept, i.e. it does not contain \sQuote{-1}. See Details below.}
  \item{verbose}{Logical switching log messages on and off.}
  \item{\dots}{Additional arguments passed to the \code{\link[BMA]{bic.glm}} function of the \pkg{BMA} package.}
}
\details{
The function converts the given multinomial data into a combination of binary logistic data, as proposed in Yeung et al. (2005). It requires that the model can be specified as a set of equations of which one is considered as the base equation. If variables are included that vary over alternatives, they are normalized by subtracting the values corresponding to the base alternative. Details of the conversion algorithm are described in the vignette of this package, see \code{vignette('conversion')}.

The function then applies the \code{\link[BMA]{bic.glm}} function of the \pkg{BMA} package on the converted data by using the Begg & Gray (1984) approximation. In the last step of the variable selection procedure, if \code{approx} is \code{FALSE}, the maximum likelihood estimation (MLE) is applied to all selected models and the Bayesian Information Criterium (BIC) is recomputed using the log-likelihood of the full multinomial logistic regression model. Note that this step can be computationally very expensive. We suggest when using this option, set the \code{verbose} argument to \code{TRUE} to follow the computation progress. Note that one can use the \code{\link{estimate.mlogit}} function on the resulting object which performs the MLE on selected models only. 

The \pkg{BMA} functions always include the intercept which in the MNL settings corresponds to the alternative specific constant (asc) of the second alternative (relative to the base alternative). If \code{include.intercepts=TRUE} (default), asc for all the remaining alternatives are also always included in the selected models. If it is set to \code{FALSE}, the asc of the remaining alternatives (i.e. third and higher) are treated as ordinary variables, i.e candidates for selection as well as exclusion.
}

\value{
The function returns an object of class \code{bic.mlogit} containing the following components:  
\item{bic.glm}{Object of class \code{\link[BMA]{bic.glm}} which results from applying BMA on the binary logistic data.}
\item{bin.logit}{List with results from the \code{\link{mlogit2logit}} function.}
\item{spec}{Object of class \code{\link{mnl.spec}} containing the MNL specification of the full model.}
\item{bma.specifications}{List of objects of class \code{\link{mnl.spec}} containing specifications for each selected model.}
\item{approx}{Value of the \code{approx} argument.} 
}
\references{
Begg, C.B., Gray, R. (1984) Calculation of polychotomous logistic regression parameters using individualized regressions. Biometrika \bold{71}, 11--18.

Yeung, K.Y., Bumgarner, R.E., Raftery, A.E. (2005) Bayesian model averaging: development of an improved multi-class, gene selection and classification tool for microarray data. Bioinformatics \bold{21} (10), 2394--2402.
}
\author{
Hana Sevcikova, Adrian Raftery
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[BMA]{bic.glm}}, \code{\link{summary.bic.mlogit}}, \code{\link{imageplot.mlogit}}, \code{\link{estimate.mlogit}}.
}
\examples{
data('heating')
res <- bic.mlogit(depvar ~ ic + oc + income + rooms, heating, choices=1:5, 
                  varying=3:12, verbose=TRUE, approx=FALSE, sep='')
summary(res)
imageplot.mlogit(res)
plot(res)

# use approximate BMA and estimate the models afterwards
res <- bic.mlogit(depvar ~ ic + oc | income + rooms, heating, choices=1:5, 
                  varying=3:12, verbose=TRUE, approx=TRUE, sep='')
summary(res)
estimate.mlogit(res, heating)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{regression}
\keyword{models}
\keyword{classes}


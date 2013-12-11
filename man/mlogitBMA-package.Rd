\name{mlogitBMA-package}
\alias{mlogitBMA-package}
\alias{mlogitBMA}
\docType{package}
\title{
Bayesian Model Averaging for Multinomial Logit Models
}
\description{
Provides a modified function \code{\link[BMA]{bic.glm}} of the \pkg{BMA} package that can be applied to multinomial logit (MNL) data. The data is converted to binary logit using the Begg & Gray approximation. The package also contains functions for maximum likelihood estimation of MNL models.
}
\details{
\tabular{ll}{
Package: \tab mlogitBMA\cr
Version: \tab 0.1-6 \cr
Date: \tab 2012-12-11\cr
Depends: \tab R (>= 2.9.0), BMA, abind, maxLik \cr
}
The main function of the package is \code{\link{bic.mlogit}} which runs the Bayesian Model Averaging on multinomial logit data. Results can be explored using \code{\link{summary.bic.mlogit}}, \code{\link{imageplot.mlogit}}, or \code{\link{plot.bic.mlogit}} functions.

An MNL estimation of a single model can be done using  \code{\link{estimate.mlogit}}. Use \code{\link{summary.mnl}} to view its results.
}
\author{
Hana Sevcikova, Adrian Raftery

Maintainer: Hana Sevcikova <hanas@uw.edu>
}
\references{
Begg, C.B., Gray, R. (1984) Calculation of polychotomous logistic regression parameters using individualized regressions. Biometrika \bold{71}, 11--18.
	
Raftery, A.E. (1995) Bayesian model selection in social research (with Discussion). Sociological Methodology 1995 (Peter V. Marsden, ed.), 111--196, Cambridge, Mass.: Blackwells.

Train, K.E. (2003) Discrete Choice Methods with Simulation. Cambridge University Press.
	
Yeung, K.Y., Bumgarner, R.E., Raftery, A.E. (2005) Bayesian model averaging: development of an improved multi-class, gene selection and classification tool for microarray data. Bioinformatics \bold{21} (10), 2394--2402.

 
}
\keyword{ package }
\seealso{\code{\link[BMA:bic.glm]{bic.glm}}
}
%\examples{
%~~ simple examples of the most important functions ~~
%}

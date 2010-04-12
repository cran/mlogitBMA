\name{summary.bic.mlogit}
\Rdversion{1.1}
\alias{summary.bic.mlogit}
\alias{plot.bic.mlogit}
\alias{imageplot.mlogit}

\title{
Summary and Plotting Functions
}
\description{
Summarizes and plots results of the \code{\link{bic.mlogit}} function.
}
\usage{
\method{summary}{bic.mlogit}(object, \dots)

\method{plot}{bic.mlogit}(x, \dots)

imageplot.mlogit (x , \dots)
}

\arguments{
  \item{object, x}{Object of class \code{\link{bic.mlogit}}.}
  \item{\dots}{Arguments passed to the underlying functions.}
}
\details{
\code{summary} prints a summary of \code{object}, using the \pkg{BMA} function \code{\link[BMA]{summary.bic.glm}}. It also prints a summary of the model specification, using \code{\link{summary.mnl.spec}}.

\code{plot} produces a plot of the posterior distribution of the coefficients produced by model averaging. It uses the \pkg{BMA} function \code{\link[BMA]{plot.bic.glm}}.

\code{imageplot.mlogit} creates an image of the selected models, using the \pkg{BMA} function \code{\link[BMA]{imageplot.bma}}.
}

%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Hana Sevcikova
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bic.mlogit}}
}
\examples{
# See example in bic.mlogit 
}

\keyword{ print }
\keyword{ hplot }

\name{summary.mnl.spec}
\Rdversion{1.1}
\alias{summary.mnl.spec}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summary for a Specification Object
}
\description{
Prints summary for a specification object of a multinomial logit model.
}
\usage{
\method{summary}{mnl.spec} (object, ...)
}
\arguments{
  \item{object}{Object of class \code{\link{mnl.spec}}.}
  \item{\dots}{Not used.}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
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
\code{\link{mnl.spec}}
}
\examples{
data(heating)
spec <- mnl.spec(depvar ~ ic | oc, heating, varying=3:12, sep='')
summary(spec)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ print }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

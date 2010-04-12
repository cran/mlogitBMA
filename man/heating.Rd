\name{heating}
\Rdversion{1.1}
\alias{heating}
\docType{data}
\title{
Heating Dataset
}
\description{
Kenneth Trains dataset containing data on choice of heating system in California houses.
}
\usage{data(heating)}
\format{
  A data frame with 900 observations on the following 19 variables.
  \describe{
    \item{\code{idcase}}{Observation number.}
    \item{\code{depvar}}{Identifies the chosen alternative (1-5).}
    \item{\code{ic1}}{Installation cost for a gas central system.}
    \item{\code{ic2}}{Installation cost for a gas room system.}
    \item{\code{ic3}}{Installation cost for a electric central system.}
    \item{\code{ic4}}{Installation cost for a electric room system.}
    \item{\code{ic5}}{Installation cost for a heat pump.}
    \item{\code{oc1}}{Annual operating cost for a gas central system.}
    \item{\code{oc2}}{Annual operating cost for a gas room system.}
    \item{\code{oc3}}{Annual operating cost for a electric central system.}
    \item{\code{oc4}}{Annual operating cost for a electric room system.}
    \item{\code{oc5}}{Annual operating cost for a heat pump.}
    \item{\code{income}}{Annual income of the household.}
    \item{\code{agehed}}{Age of the household head.}
    \item{\code{rooms}}{Number of rooms in the house.}
    \item{\code{ncost1}}{Identifies whether the house is in the northern coastal region.}
    \item{\code{scost1}}{Identifies whether the house is in the southern coastal region.}
    \item{\code{mountn}}{Identifies whether the house is in the mountain region.}
    \item{\code{valley}}{Identifies whether the house is in the central valley region.}
  }
}
\details{
The observations consist of single-family houses in 
California that were newly built and had central air-conditioning. The choice is among heating systems. 
Five types of systems are considered to have been possible:

(1) gas central, 
(2) gas room, 
(3) electric central, 
(4) electric room, 
(5) heat pump. 

For these data, the costs were calculated as the amount the system would cost if it were installed in the house, given the characteristics of the house (such as size), the price of
 gas and electricity in the house location, and the weather conditions in the area (which 
determine the necessary capacity of the system and the amount it will be run.) These cost 
are conditional on the house having central air-conditioning. (That is  why the installation
 cost of gas central is lower than that for gas room: the central system can use the air-conditioning 
 products that have been installed.)
}

\note{This help file was created using Kenneth Trains description of the dataset, see Source.}

\source{
http://elsa.berkeley.edu/~train/distant.html
}
\references{
Train, K.E. (2003) Discrete Choice Methods with Simulation. Cambridge University Press.
}
\examples{
data(heating)
head(heating)
}
\keyword{datasets}

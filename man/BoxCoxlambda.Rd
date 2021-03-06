\name{BoxCox.lambda}
\alias{BoxCox.lambda}
\title{Automatic selection of Box Cox transformation parameter}
\usage{BoxCox.lambda(x, method=c("guerrero","loglik"), lower=-1, upper=2)
}
\arguments{
\item{x}{a numeric vector or time series}
\item{method}{Choose method to be used in calculating lambda.}
\item{lower}{Lower limit for possible lambda values.}
\item{upper}{Upper limit for possible lambda values.}
}
\description{If \code{method=="guerrero"}, Guerrero's (1993) method is used, where lambda minimizes the coefficient of variation for subseries of \code{x}. 

If \code{method=="loglik"}, the value of lambda is chosen to maximize the profile log likelihood of a linear model fitted to \code{x}. For non-seasonal data, a linear time trend is fitted while for seasonal data, a linear time trend with seasonal dummy variables is used.
}
\value{a number indicating the Box-Cox transformation parameter.
}

\references{Box, G. E. P. and Cox, D. R. (1964) An analysis of transformations. \emph{JRSS B} \bold{26} 211--246.

Guerrero, V.M. (1993) Time-series analysis supported by power transformations. \emph{Journal of Forecasting}, \bold{12}, 37--48.
}
\seealso{\code{\link{BoxCox}}}
\author{Leanne Chhay and Rob J Hyndman}
\examples{
lambda <- BoxCox.lambda(AirPassengers,lower=0)
air.fit <- Arima(AirPassengers, order=c(0,1,1),
                 seasonal=list(order=c(0,1,1),period=12), lambda=lambda)
plot(forecast(air.fit))
}
\keyword{ts}

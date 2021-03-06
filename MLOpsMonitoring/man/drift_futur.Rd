% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drift_score.R
\name{drift_futur}
\alias{drift_futur}
\title{Drift Score : model detecting drift between 
train and test data sets}
\usage{
drift_futur(X_train, start = "2011-01-01", end = "2011-12-31", windows,
  kind)
}
\arguments{
\item{X_train}{: data.table, train data set}

\item{start}{: start of the period}

\item{end}{: end of the period}

\item{windows}{: see ?MLOpsMonitoring::create_features_on_period}

\item{kind}{: see ?MLOpsMonitoring::create_features_on_period}
}
\value{
list of performance indicators (of drift model)
}
\description{
Drift Score : model detecting drift between 
train and test data sets
}

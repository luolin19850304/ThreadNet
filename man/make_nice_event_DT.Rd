% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ThreadNet_Misc.R
\name{make_nice_event_DT}
\alias{make_nice_event_DT}
\title{make_nice_event_DT}
\usage{
make_nice_event_DT(e)
}
\arguments{
\item{e}{data frame with POV}
}
\description{
Issue is that DT::renderdatatable cannot display lists correctly, so cut then out.

Removes columns that do not need to be displayed
}

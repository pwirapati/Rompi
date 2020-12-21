\name{Rompi}
\alias{Rompi}
\alias{Rompi_get_num_procs}
\alias{Rompi_get_max_threads}
\alias{Rompi_set_num_threads}
\alias{Rompi_get_schedule}
\alias{Rompi_set_schedule}

\title{R OpenMP utilities}
\description{Interface to some OpenMP functions for controlling
runtime parameters}
\usage{
  Rompi_get_num_procs()
  Rompi_get_max_threads()
  Rompi_set_num_threads(nthreads)
  Rompi_get_schedule()
  Rompi_set_schedule(kind,chunk_size)
}
\arguments{
  \item{nthreads}{The number of threads}
  \item{kind}{\code{"static"}, \code{"dynamic"}, \code{"guided"} or \code{"auto"}}
  \item{chunk_size}{The size of chunks}
  }
\details{
  \code{Rompi_get_num_procs} return the number of processors. On Intel
  under linux, the number includes virtual processors provided by
  hyperthreading.

  \code{Rompi_get_max_threads} return the number of threads that will
  be used by the next parallel section. This number may be the same
  as \code{Rompi_get_num_procs} by default, but modified by environment
  variable \code{OMP_NUM_THREADS} set before running R. It is also
  modified by \code{Rompi_set_num_threads}.

  \code{Rompi_set_num_threads} set the number of threads used by
  subsequent parallel sections.

  \code{Rompi_get_schedule} returns a list of the \code{kind} of schedule
  (one of strings \code{static}, \code{dynamic}, \code{guided} or \code{auto}),
  and the \code{chunk_size} parameter associated with the kind
  of scheduling. See OpenMP manual for details.

  \code{Rompi_set_schedule} sets the schedule.
}
\value{
  \code{Rompi_get_num_procs}, \code{Rompi_get_max_threads}, and
  \code{Rompi_set_num_threads} return an integer of the number
  of threads.
 
  \code{Rompi_get_schedule} and \code{Rompi_set_schedule}
  return a list of \code{kind}
  (a string of schedule name) and \code{chunk_size} (an integer).
}

# R interface to some OpenMP runtime controls

# number of processors (hardware hyperthreads):
Rompi_get_num_procs <- function() .C("Rompi_get_num_procs",integer(1))[[1]]

# number of threads available, as specified by
# OMP_NUM_THREADS if set, otherwise omp_get_num_procs()
#
Rompi_get_max_threads <- function() .C("Rompi_get_max_threads",integer(1))[[1]]

# set max_threads to be used by subsequent parallel sections
#
Rompi_set_num_threads <- function(nthreads)
  .C("Rompi_set_num_threads",as.integer(nthreads))[[1]]

Rompi_schedules <- c("static","dynamic","guided","auto")

# Return the kind of schedule and chunksize
#
Rompi_get_schedule <- function()
{
  ret <- .C("Rompi_set_schedule",
    kind=integer(1),chunk_size=integer(1))
  ret$kind <- Rompi_schedules[ret$kind]
  ret
}

Rompi_set_schedule <- function(kind,chunk_size=0)
{
  k <- pmatch(kind,Rompi_schedules)
  if(is.na(k)) stop("unknown kind of schedule")
  ret <- .C("Rompi_set_schedule",
    kind=as.integer(k),chunk_size=as.integer(chunk_size))
  ret$kind <- Rompi_schedules[ret$kind]
  ret
}

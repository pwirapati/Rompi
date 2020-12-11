# Romp

R interface to various openMP functions such as 
`omp_get_num_procs()`, `omp_get_max_threads()`,
`omp_set_num_threads()` and `omp_{get,set}_schedule()`.

See `?Romp` in R after installing and loading.

Installation may be a problem when the compiler does not support
OpenMP or without/misconfigured run-time library (e.g., `libgomp` or `libomp`).
It is not an issue on most Linux distros with `gcc`.

When loaded, the library set the number of maximum
threads to half of those returned by `omp_get_num_procs()`.
On common processors, this uses the number of cores instead
of hyperthreads.

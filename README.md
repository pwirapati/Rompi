# Rompi

This package contains R interface to various commonly used openMP library functions such as:

* `omp_get_num_procs()`get the number of (virtual) processors
* `omp_get_max_threads()` get the current maximum number of available threads (which will be obeyed by `#pragma omp parallel for schedule(runtime)`
* `omp_set_num_threads()` change the number of maximum threads
*  `omp_{get,set}_schedule()` get and set scheduling and chunk size for parallel for-loops.

See details in `?Rompi` in R after installing and loading.

These functions change the global state of OpenMP runtime execution (some of which can also be specified via environment variables or `#pragma omp` arguments). If the OpenMP code allows runtime modifications, such as using `schedule(runtime)` for parallel loops, then the `Rompi*` functions can be used to change the behavior by invoking them prior to calling the R wrapper functions that uses the OpenMP code.

## Installation

```R
devtools::install_github("pwirapati/Rompi")
```

or

```R
remotes::install_github("pwirapati/Rompi")
```

Installation (or loading the package) may be a problem when the compiler does not support
OpenMP or without/misconfigured run-time library (e.g., `libgomp` or `libomp`).
It is not an issue on most Linux distros with `gcc`, but can be tricky on MacOSX depending on the version of R, Xcode and/or other compilers such as `gcc` installation by `brew`.
For Xcode with `clang` as the default compiler, follow the instruction on this [page]( https://mac.r-project.org/openmp/)  to install the appropriate version of `libomp` dynamic library. It is  necessary to create the file `~/.R/Makevars` with the following content:

```makefile
CPPFLAGS += -Xclang -fopenmp
LDFLAGS += -lomp
```

## Running

```R
library(Rompi)
```

Note: the package may be compiled and installed correctly, but failed when loaded because R can not find the OpenMP dynamic library. Some OpenMP dependent packages can still be run if they don't call library functions, but `Rompi` and other packages that needs the thread ids, maximum number of threads, etc. through library functions `<omp.h>` will not work.

When successfully loaded, the library set the number of maximum threads to half of those returned by `omp_get_num_procs()`. On common processors (such as commodity Intel and AMD) with hyperthreading enabled, this set the number of threads to the number physical cores. Typically there is very little advantage in using all the hyperthreads.

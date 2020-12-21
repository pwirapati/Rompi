.onLoad <- function(libname,pkgname)
{
	Rompi_set_num_threads( min(floor(Rompi_get_num_procs()/2),1) )
}

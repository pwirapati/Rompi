.onLoad <- function(libname,pkgname)
{
	Rompi_set_num_threads( max(floor(Rompi_get_num_procs()/2),1) )
}

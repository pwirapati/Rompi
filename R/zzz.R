.onLoad <- function(libname,pkgname)
{
	Romp_set_num_threads( min(floor(Romp_get_num_procs()/2),1) )
}

#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* File created using
 * tools::package_native_routine_registration_skeleton("mlogitBMA", character_only = FALSE)
 */

/* FIXME: 
 Check these declarations against the C/Fortran source code.
 */

/* .Fortran calls */
extern void F77_NAME(fwleaps)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);

static const R_FortranMethodDef FortranEntries[] = {
    {"fwleaps", (DL_FUNC) &F77_NAME(fwleaps), 22},
    {NULL, NULL, 0}
};

void R_init_mlogitBMA(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, NULL, FortranEntries, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

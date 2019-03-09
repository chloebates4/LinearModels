#include "L2.h"
#include <R.h>
#include <R_ext/Rdynload.h>

void L2_Penalties_interface (const double X_mat, 
                             const double Y_vec, 
                             const double penalty_vec)
{
  int L2SquarePenaltiesStatus = LMSquareLossL2penalties(X_mat, 
                        Y_vec, penalty_vec);
  int L2LogisticPenaltiesStatus = LMLogisticLossL2penalties(X_mat, 
                        Y_vec, penalty_vec);
  
  if(L2SquarePenaltiesStatus != 0)
  {
    error("non-zero exit status from LMSquareLossL2penalties");
  }
  else if(L2LogisticPenaltiesStatus != 0)
  {
    error("non-zero exit status from LMLogisticLossL2penalties");
  }
}

R_CMethodDef CMethods[] = {
  {"L2_Penalties_interface", (DL_FUNC) &L2_Penalties_interface, 3}, 
  {NULL, NULL, 0}
};

extern "C" {
  void R_init_LinearModels(DllInfo *info){
    R_registerRoutines(info, CMethods, NULL, NULL, NULL);
    //R_useDynamicSymbols call says the DLL is not to be searched for
    //entry points specified by character strings so .C etc calls will
    //only find registered symbols.
    R_useDynamicSymbols(info, FALSE); 
  }
}



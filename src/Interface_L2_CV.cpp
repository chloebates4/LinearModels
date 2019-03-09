#include "L2.h"
#include <R.h>
#include <R_ext/Rdynload.h>

void L2_CV_interface (const double X_mat, 
                      const double Y_vec,
                      const double fold_vec,
                      const double penalty_vec)
{
  int L2SquareCVStatus = LMSquareLossL2CV(X_mat, 
                        Y_vec, fold_vec, penalty_vec);
  int L2LogisticCVStatus = LMLogisticLossL2CV(X_mat, 
                        Y_vec, fold_vec, penalty_vec);
  
  if(L2SquareCVStatus != 0)
  {
    error("non-zero exit status from LMSquareLossL2CV");
  }
  else if(L2LogisticCVStatus != 0)
  {
    error("non-zero exit status from L2SquareCVStatus");
  }
}

R_CMethodDef CMethods[] = {
  {"L2_CV_interface", (DL_FUNC) &L2_CV_interface, 4}, 
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



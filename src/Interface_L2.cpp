#include "L2.h"
#include <R.h>
#include <R_ext/Rdynload.h>

void L2_interface (const double X_scaled_mat,
                   const double Y_vec, 
                   const double penalty, //non-negative number scalar
                   const double opt_thresh, //positive numeric scalar
                   const double initial_weight_vec, 
                   const double step_size)
{
  int L2SquareStatus = LMSquareLossL2(X_scaled_mat, Y_vec, penalty, 
                    opt_thresh, initial_weight_vec, step_size);
  int L2LogisticStatus = LMLogisticLossL2(X_scaled_mat, Y_vec, penalty, 
                    opt_thresh, initial_weight_vec, step_size);
  
  if(L2SquareStatus != 0)
  {
    error("non-zero exit status from L2SquareStatus");
  }
  else if(L2LogisticStatus != 0)
  {
    error("non-zero exit status from L2LogisticStatus");
  }
}
void sigmoid_interface(const double z)
{
  int sigmoidStatus = sigmoid(z); 
  if(sigmoidStatus != 0)
  {
    error("non-zero exit status from sigmoidStatus");
  }
}

R_CMethodDef CMethods[] = {
  {"L2_interface", (DL_FUNC) &L2_interface, 6}, 
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



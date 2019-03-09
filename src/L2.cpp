#include "L2.h"
#include <Eigen/Dense> //matrix library, does dynamic memory allocation 
#include <iostream>

int LMSquareLossL2(const double X_scaled_mat,
                   const double Y_vec, 
                   const double penalty, //non-negative number scalar
                   const double opt_thresh, //positive numeric scalar
                   const double initial_weight_vec)
{
  
  
  return 0;
}

int LMLogisticLossL2(const double X_scaled_mat,
                     const double Y_vec, 
                     const double penalty, //non-negative number scalar
                     const double opt_thresh, //positive numeric scalar
                     const double initial_weight_vec)
{
  // TODO
  
  return 0;
}

int LMSquareLossL2penalties(const double X_mat, 
                            const double Y_vec, 
                            const double penalty_vec)
{
  // TODO
  
  return 0;
}

int LMLogisticLossL2penalties(const double X_mat, 
                              const double Y_vec, 
                              const double penalty_vec)
{
  // TODO
  
  return 0;
}

int LMSquareLossL2CV(const double X_mat, 
                     const double Y_vec,
                     const double fold_vec,
                     const double penalty_vec)
{
  // TODO
  
  return 0;
}

int LMLogisticLossL2CV(const double X_mat, 
                       const double Y_vec,
                       const double fold_vec,
                       const double penalty_vec)
{
  // TODO
  
  return 0;
}


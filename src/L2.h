
const double STEP_SIZE = .5; 

int LMSquareLossL2(const double X_scaled_mat,
                   const double y_vec, 
                   const double penalty, //non-negative number scalar
                   const double opt_thresh, //positive numeric scalar
                   const double initial_weight_vec);

int LMLogisticLossL2(const double X_scaled_mat,
                     const double y_vec, 
                     const double penalty, //non-negative number scalar
                     const double opt_thresh, //positive numeric scalar
                     const double initial_weight_vec);

int LMSquareLossL2penalties(const double X_mat, 
                            const double Y_vec, 
                            const double penalty_vec);

int LMLogisticLossL2penalties(const double X_mat, 
                              const double Y_vec, 
                              const double penalty_vec);

int LMSquareLossL2CV(const double X_mat, 
                     const double Y_vec,
                     const double fold_vec,
                     const double penalty_vec);

int LMLogisticLossL2CV(const double X_mat, 
                       const double Y_vec,
                       const double fold_vec,
                       const double penalty_vec);


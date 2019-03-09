
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

int LMSquareLossL2penalties();

int LMLogisticLossL2penalties();

int LMSquareLossL2CV();

int LMLogisticLossL2CV();
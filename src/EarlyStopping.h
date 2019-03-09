int LMSquareLossIterations(const double X_mat,
                           const double Y_vec, 
                           const double max_iterations, 
                           const double step_size);

int LMLogisticLossIterations(const double X_mat,
                             const double Y_vec, 
                             const double max_iterations, 
                             const double step_size);

int LMSquareLossEarlyStoppingCV();

int LMLogisticLossEarlyStoppingCV();
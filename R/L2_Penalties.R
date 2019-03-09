#' L2 Regularization using Square / Logistic Loss
#'
#'This function should begin by scaling X.mat to obtain X.scaled.mat 
#'with each column mean=0 and sd=1 
#'
#'It should then loop over penalty values, 
#'calling LM__LossL2 to get the (scaled) optimal weight vector for each.
#'
#'It should then convert the optimal weight vector (tilde w/tilde beta) 
#'back to the original scale, using the mean/sd of each column/feature.
#'
#'Use warm restarts, i.e. instead of starting the optimization from the 
#'0 vector each time (slow), use the optimal solution for the previous 
#'penalty value as the next initial.weight.vec (faster).
#'
#' @param X.mat 
#' @param Y.vec 
#' @param penalty.vec vector of decreasing penalty values
#'
#' @return W.mat (n_features+1 x n_penalties), weight matrix on original scale, that can be used to get predictions via cbind(1, X.mat) %*% W.mat (the first row of W.mat should be the bias/beta/intercept)
#' @export
#'
#' @examples
LMSquareLossL2penalties <- function(X.mat, Y.vec, penalty.vec)
{
  result.list <- .C(
    "L2_Penalties_interface", as.double(X.mat), as.double(Y.vec), 
    as.double(penalty.vec), predictions=double(penalty.vec), 
    PACKAGE="LinearModels")
  result.list$predictions
}
LMLogisticLossL2penalties <- function(X.mat, Y.vec, penalty.vec)
{
  result.list <- .C(
    "L2_Penalties_interface", as.double(X.mat), as.double(Y.vec), 
    as.double(penalty.vec), predictions=double(penalty.vec), 
    PACKAGE="LinearModels")
  result.list$predictions
}

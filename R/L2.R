#' L2 Regularization using Square / Logistic Loss
#'
#'Finds the optimal weight vector that minimizes the following cost 
#'function: ∑i=1^n L[w^T x_i, y_i] + penalty * ||w||, where L is either 
#'the logistic or square loss.
#'
#' @param X.scaled.mat already has mean=0 and sd=1 for each of its columns
#' @param Y.vec label vector 1xn
#' @param penalty non-negative numeric scalar
#' @param opt.thresh positive numeric scalar that controls when to stop and declare that a particular weight vector is “optimal” numerically
#' @param initial.weight.vec initial weight vector
#'
#' @return optimal weight vector (˜ w, for scaled data) for the given penalty parameter
#' @export
#'
#' @examples
#' data(spam, package="ElemStatLearn")
#' 
#' optimalWeight<-LMLogisticLossIterations(X.scaled.mat, Y.vec, penalty, opt.thresh, initial.weight.vec)
LMLogisticLossL2 <- function(X.scaled.mat, y.vec, penalty, opt.thresh, 
                             initial.weight.vec)
{
  result.list <- .C(
    "L2_interface", as.double(X.scaled.mat), as.double(Y.vec), 
    as.double(penalty), as.double(opt.thresh), 
    as.double(initial.weight.vec), predictions=double(initial.weight.vec), 
    PACKAGE="LinearModels")
  result.list$predictions
}

LMSquareLossL2 <- function(X.scaled.mat, y.vec, penalty, opt.thresh, 
                           initial.weight.vec)
{
  result.list <- .C(
    "L2_interface", as.double(X.scaled.mat), as.double(Y.vec), 
    as.double(penalty), as.double(opt.thresh), 
    as.double(initial.weight.vec), predictions=double(initial.weight.vec), 
    PACKAGE="LinearModels")
  result.list$predictions
}

#' LMSquareLossL2
#'
#'Finds the optimal weight vector that minimizes the following cost 
#'function: ∑i=1^n L[w^T x_i, y_i] + penalty * ||w||, where L is either 
#'the square loss.
#'
#' @param X.scaled.mat already has mean=0 and sd=1 for each of its columns
#' @param Y.vec label vector 1xn
#' @param penalty non-negative numeric scalar
#' @param opt.thresh positive numeric scalar that controls when to stop and declare that a particular weight vector is “optimal” numerically
#' @param initial.weight.vec initial weight vector
#' @param step.size constant we will decide 
#'
#' @return optimal weight vector (˜ w, for scaled data) for the given penalty parameter
#' @export
#'
#' @examples
#' library(LinearModels)
#' data(spam, package="ElemStatLearn")
#' step.size<-.01
LMSquareLossL2 <- function(X.scaled.mat, Y.vec, penalty, opt.thresh, 
                           initial.weight.vec)
{
  
}


#' LMLogisticLossL2
#'
#' Finds the optimal weight vector that minimizes the following cost 
#'function: ∑i=1^n L[w^T x_i, y_i] + penalty * ||w||, where L is either 
#'the logistic loss.
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
#' X.scaled.mat<-scale(spam[1:100, -24])
#' Y.vec<-spam[1:100, 24]
#' penalty<-1
#' opt.thresh<-.01
#' initial.weight.vec<-rep()
LMLogisticLossL2 <- function(X.scaled.mat, Y.vec, penalty, opt.thresh, 
                           initial.weight.vec, step.size)
{
  opt.weight<-initial.weight.vec
  sigmoid<-function(z){
    (1+exp(-z))^-1
  }
  
  
}
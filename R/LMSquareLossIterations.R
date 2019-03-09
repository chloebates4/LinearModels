#' LMSquareLossIterations
#'
#' @param X.scaled.mat already has mean=0 and sd=1 for each of its columns
#' @param Y.vec label vector 1xn
#' @param penalty non-negative numeric scalar
#' @param opt.thresh positive numeric scalar that controls when to stop and declare that a particular weight vector is “optimal” numerically
#' @param initial.weight.vec initial weight vector
#' @param step.size constant we will decide 
#' @param max.iterations 
#'
#' @return
#' @export
#'
#' @examples
#' data(spam, package="ElemStatLearn")
#' step.size<-.01
#' X.scaled.mat<-scale(spam[1:100, -24])
#' Y.vec<-spam[1:100, 24]
#' penalty<-1
#' opt.thresh<-.01
#' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
LMSquareLossIterations<-function(X.scaled.mat, y.vec, penalty, opt.thresh,
                                 initial.weight.vec, step.size, max.iterations)
{
  mean.mat <- attr(X.scaled.mat, "scaled:center")
  stan_dev.mat <- attr(X.scaled.mat, "scaled:scaled")
  
  for(index in 2:max.iterations)
  {
    grad <- t(X.scaled.mat) %*% (X.scaled.mat %*% initial.weight.vec - y.vec) / nrow(X.scaled.mat)
    initial.weight.vec <- initial.weight.vec - step.size * grad
    initial.weight.vec[, index] <- initial.weight.vec
  }
  
  return(initial.weight.vec)
}
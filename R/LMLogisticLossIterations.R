#' LMLogisticLossIterations
#'
#' @param X.scaled.mat already has mean=0 and sd=1 for each of its columns
#' @param y.vec label vector 1xn
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
#' y.vec<-spam[1:100, 24]
#' penalty<-1
#' opt.thresh<-.01
#' max.iterations<-100
#' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
LMLogisticLossIterations<-function(X.scaled.mat, y.vec, penalty, opt.thresh,
                                   initial.weight.vec, step.size, max.iterations)
{
  if(nrow(X.scaled.mat) <= 0 || ncol(X.scaled.mat)
     || nrow(y.vec) || ncol(y.vec))
  {
    error("The dimensions are incorrect of the input matrix or vector")
  }
  
  count <- 1
  for(index in 1:ncol(X.scaled.mat))
  {
    if(X.scaled.mat[index] == 0)
    {
      count <- count + 1
    }
  }
  

  beta.vec <- rep(0, 1, max.iterations)
  beta.temp <- 0
  
  for(iter in max.iterations)
  {
    grad <- -t(X.scaled.mat) %*% (y.vec / (1 + exp(y.vec * (
      X.scaled.mat %*% initial.weight.vec + rep(1, n.train) * beta.temp
    )))) / n.train
    
    beta.grad <- -sum(y.vec / (1 + exp(y.vec * (
      X.scaled.mat %*% initial.weight.vec + rep(1, n.train) * beta.temp
    )))) / n.train
    
    intitial.weight.vec[, iter] <- initial.weight.vec - step.size * grad
    beta.vec[iter] <- beta.temp - step.size * beta.grad
    
    intitial.weight.vec <- initial.weight.vec[, iter]
    beta.temp <- beta.vec[iter]
  }

  return(intitial.weight.vec)

}
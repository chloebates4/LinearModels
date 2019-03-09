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
#' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
LMLogisticLossL2 <- function(X.scaled.mat, Y.vec, penalty, opt.thresh, 
                           initial.weight.vec, step.size)
{
  opt.weight<-initial.weight.vec
  sigmoid<-function(z){
    (1+exp(-z))^-1
  }
  index<-0
  for(index in 100)
  {
    N<-length(X.scaled.mat)
    
    prediction<-sigmoid(as.matrix(X.scaled.mat) %*% as.matrix(initial.weight.vec))
    observations<-length(Y.vec)
    
    one_cost<- prediction * Y.vec
    two_cost<- (1-prediction) * (1-Y.vec)
    
    #sum of both costs
    cost<- one_cost + two_cost
    
    #average of cost
    cost<-sum(cost)/observations
    
    #gradient
    gradient<-(as.matrix(X.scaled.mat) %*% (prediction -cost))
    gradient<-(gradient/N)*opt.thresh

    opt.weight<-initial.weight.vec - step.size*gradient + penalty

    
    scaled.opt.weight = as.vector(opt.weight)
    
    
  }
  return(scaled.opt.weight)
  
}
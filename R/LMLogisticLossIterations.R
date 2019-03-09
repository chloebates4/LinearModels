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
  
  beta.vec <- rep(0, 1 = max.iterations)
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
  
  return intitial.weight.vec
}
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
  
  return initial.weight.vec
}
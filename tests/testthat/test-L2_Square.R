library(LinearModels)
library(testthat)
library("LMSquareLossL2")

test_that("LMSquareLossL2 working correctly", {
  data(spam, package="ElemStatLearn")
  #' step.size<-.01
  #' X.scaled.mat<-scale(spam[4601, -57])
  #' Y.vec<-spam[4601, 57]
  #' penalty<-1
  #' opt.thresh<-.01
  #' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
  
})

test_that("LMSquareLossL2 NOT working correctly because of negative penalty", {
  data(spam, package="ElemStatLearn")
  #' step.size<-.01
  #' X.scaled.mat<-scale(spam[4601, -57])
  #' Y.vec<-spam[4601, 57]
  #' penalty<- -2
  #' opt.thresh<-.01
  #' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
  
})


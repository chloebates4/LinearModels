library(LinearModels)
library(testthat)
library("LMLogisticLossL2")

test_that("LMLogisticLossL2 hopefully working", {
  data(spam, package="ElemStatLearn")
  #' step.size<-.01
  #' X.scaled.mat<-scale(spam[4601, -57])
  #' Y.vec<-spam[4601, 57]
  #' penalty<-1
  #' opt.thresh<-.01
  #' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
  
})

test_that("LMLogisticLossL2 hopefully NOT working because negative penalty", {
  data(spam, package="ElemStatLearn")
  #' step.size<-.01
  #' X.scaled.mat<-scale(spam[4601, -57])
  #' Y.vec<-spam[4601, 57]
  #' penalty<- -1
  #' opt.thresh<-.01
  #' initial.weight.vec<-rep(0, ncol(X.scaled.mat))
  
})


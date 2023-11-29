rm(list=ls())
Sys.setenv(LANG = "en")

library(rstudioapi)

setwd(dirname(getActiveDocumentContext()$path))

features <- 10

vector1 <- sign(rnorm(features))
vector2 <- sign(rnorm(features))
vector1[vector1 == -1] <- 0
vector2[vector2 == -1] <- 0
# docelowo wektory mają być pomiędzy 0 a 1
# w tym celu, prawdopodobnie trzeba będzie je znormalizować/wystandaryzować
# https://www.simplilearn.com/normalization-vs-standardization-article

  # trzy sposoby na policzenie outer product
  o1 <- outer(vector1, vector2)
  o2 <- vector1 %o% vector2
  
  vector1[1]
  vector2[1]
  
  mat <- matrix(rep(0,features^2),nrow = features)
  
  
  for (i in 1:features) {
    for (j in 1:features) {
      mat[i,j] <- vector1[i] * vector2[j]
      
    }
  }
  
  o3 <- mat
  
  o1
  o2
  o3


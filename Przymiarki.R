rm(list=ls())
Sys.setenv(LANG = "en")

library(rstudioapi)

setwd(dirname(getActiveDocumentContext()$path))

features <- 10

vector1 <- sign(rnorm(features))
vector2 <- sign(rnorm(features))
vector1[vector1 == -1] <- 0
vector2[vector2 == -1] <- 0

vector1
vector2
# docelowo wektory mają być pomiędzy 0 a 1
# w tym celu, prawdopodobnie trzeba będzie je znormalizować/wystandaryzować
# https://www.simplilearn.com/normalization-vs-standardization-article

  # trzy sposoby na policzenie outer product
  # metoda1
  o1 <- outer(vector1, vector2)
  #metoda2
  o2 <- vector1 %o% vector2
  
  #metoda3
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

  #inner product
  #metoda1
  i1 <- o1 %*% vector1
  
  #metoda2
  s <- c()
  for (i in 1:features) {
    su <- 0
    for (j in 1:features) {
      su <- su + (vector1[j] * o1[i,j])
    }
    s[i] <- su
  }
  i2 <- s

  i1
  i2
  
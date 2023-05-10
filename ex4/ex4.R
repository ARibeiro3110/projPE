set.seed(4318)
lambda <- 15.5
k <- 2055
X <- rexp(k, rate = lambda)

S <- cumsum(X)
T <- ceiling(S[k])

I <- c(rep(0, T))
for (s in S) {
  I[ceiling(s)] = I[ceiling(s)] + 1
}

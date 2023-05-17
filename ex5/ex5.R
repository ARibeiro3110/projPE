set.seed(1032)
p <- 0.45
n <- 1153

vetor <- rep(-1, n)

i <- 1

while (i <= n) {
  u <- runif(1, 0, 1)
  
  x <- 0
  while (TRUE) {
    a <- pgeom(x - 1, p, lower.tail = TRUE, log.p = FALSE)
    b <- pgeom(x, p, lower.tail = TRUE, log.p = FALSE)
    if (a < u && u <= b) {
      vetor[i] = x
      break
    }
    x <- x + 1
  }
  
  i <- i + 1
}

# CONTINUAR
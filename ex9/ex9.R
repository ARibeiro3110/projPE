set.seed(1593)
k <- 1000
p <- 0.5
γ <- 0.91
α <- 1 - γ
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
m <- length(n_values)

medias_diferencas <- numeric(length(n_values))

for (i in 1:m) {
  diferencas <- numeric(k)
  
  for (j in 1:k) {
    X <- rbinom(n, size = 1, prob = p)
    
    # Método 1
    media <- mean(X)
    z <- qnorm((1 + γ)/2, mean = 0, sd = 1)
    
      ## Resolução da equação de segundo grau:
      a <- (1 + z^2 / n)
      b <- -2 * media - z^2 / n
      c <- media^2
      solucao1 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)
      solucao2 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)
      comprimento1 <- abs(solucao1 - solucao2)
    
    # Método 2
    b <- qnorm(1 - α/2, mean = 0, sd = 1)
    limite_inferior <- media - b * sqrt( (media * (1 - media)) / n_values[i])
    limite_superior <- media + b * sqrt( (media * (1 - media)) / n_values[i])
    comprimento2 <- limite_superior - limite_inferior
    
    # Diferença entre os comprimentos
    diferencas[j] <- abs(comprimento2 - comprimento1)
  }
  
  medias_diferencas[i] <- mean(diferencas)
}

# Criar o gráfico
dev.new()
plot(n_values, medias_diferencas, col = "blue", pch = 19, type = "b",
     xlab = "Tamanho da amostra",
     ylab = "Diferença entre os comprimentos dos intervalos de confiança",
     main = "Diferenças médias entre os comprimentos dos intervalos de confiança
construídos pelo Método 2 e pelo Método 1, em função do tamanho da amostra")

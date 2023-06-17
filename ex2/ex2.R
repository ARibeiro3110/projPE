# Carregamento dos dados
tempo <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/TIME_USE_24092022.csv",
         sep = ",", header = TRUE)

# Eliminação dos registos referentes à África do Sul
tempo <- subset(tempo, tempo$País != "África do Sul")

# Registos para Total (Homens + Mulheres)
tempo <- subset(tempo, tempo$Sexo == "Total")

# Dados das ocupações a utilizar
cuidados <- subset(tempo, tempo$Ocupação == "Cuidados pessoais")
trabalho <- subset(tempo, tempo$Ocupação == "Trabalho remunerado ou estudo")

# Construção dos diagramas de extremos e quantis
dev.new()
par(mar = c(5, 7, 4, 2), cex.axis = 1)
boxplot(cuidados$Tempo, trabalho$Tempo, col = c("red", "blue"),
        main = "Tempos médios diários registados para Total (Homens + Mulheres)
em duas ocupações distintas",
        xlab = "Tempo médio diário (minutos)",
        horizontal = TRUE, names = c("Cuidados\npessoais",
                                     "Trabalho\nremunerado\nou estudo"), las = 1)

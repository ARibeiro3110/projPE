tempo <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/TIME_USE_24092022.csv", sep = ",", header = TRUE)
tempo <- subset(tempo, tempo$País != "África do Sul")
tempo <- subset(tempo, tempo$Sexo == "Total")

cuidados <- subset(tempo, tempo$Ocupação == "Cuidados pessoais")
trabalho <- subset(tempo, tempo$Ocupação == "Trabalho remunerado ou estudo")

dev.new()
par(mar = c(5, 7, 4, 2), cex.axis = 1)
boxplot(cuidados$Tempo, trabalho$Tempo, col = c("red", "blue"),
        main = "Tempos médios diários registados para Total (Homens + Mulheres)\nem duas ocupações distintas",
        horizontal = TRUE, names = c("Cuidados\npessoais", "Trabalho\nremunerado\nou estudo"),
        notch = TRUE, las = 1)

# text(x = fivenum(cuidados$Tempo)[c(1,3,5)], labels = fivenum(cuidados$Tempo)[c(1,3,5)], y = 1.5)
# text(x = fivenum(cuidados$Tempo)[c(2,4)], labels = fivenum(cuidados$Tempo)[c(2,4)], y = 0.5)

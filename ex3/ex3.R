library(ggplot2)

# Carregamento dos dados
dados <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt",
                  sep = "\t", header = TRUE)

# Eliminação dos dados não referentes à variável relevante
dados <- subset(dados, dados$IND == "EMP2")

# Filtragem por sexo, grupos etários, ano e país
dados <- subset(dados, dados$SEX == "MEN" | dados$SEX == "WOMEN")
dados <- subset(dados, dados$AGE == "1524" | dados$AGE == "2554" | dados$AGE == "5564")
dados <- subset(dados, dados$TIME == 2019)
dados <- subset(dados, dados$COU == "NOR")

dev.new()
par(mar = c(5, 7, 4, 2), cex.axis = 1)
ggplot(dados, aes(x = Age.Group, y = Value, fill = factor(Sex))) +
  ggtitle("Employment/population ratio, by sex and age group in 2019 in Norway") +
  xlab("\nAge group") +
  ylab("Employment / population ratio\n") +
  labs(fill = "") +
  geom_col(position = "dodge", colour = "black") +
  geom_text(
    aes(label = Value), vjust = 1.5,
    colour = "black", size = 8,
    position = position_dodge(.9)
  ) +
  theme(  plot.title = element_text(size = 30),
          axis.title.x = element_text(size = 24), axis.title.y = element_text(size = 24),
          legend.text = element_text(size = 22), legend.key = element_blank(),
          axis.text.x = element_text(size = 24), axis.text.y = element_text(size = 24))

#####################
####Projeto Covid####
#####################

#####################
#TRATAMENTO DE DADOS#
#####################

#Pacotes
library(dplyr)

#ambiente
setwd("C:\\Users\\thiago.fofano\\Documents\\projeto covid")
getwd()
dados <- read.csv("dados_covid_sp.csv", sep = ";",na.strings = "" ,stringsAsFactors = T)

#TRATAMENTO DE DADOS E LIMPEZA

#Renomeando variáveis
dados_alterado <- rename(dados, municipio = nome_munic,
                         data = datahora,
                         casos_total = casos,
                         obitos_total = obitos)
#Excluindo variáveis que não serão usadas
dados_alterado <- select(dados_alterado, -c(2:4,15,16,22:26))
dados_alterado <- filter(dados_alterado, casos_novos != 0)  

#Ajuste das variáveis
glimpse(dados_alterado)
dados_alterado$data <- as.Date(dados_alterado$data)
dados_alterado$casos_pc <- as.integer(dados_alterado$casos_pc)
dados_alterado$casos_mm7d <- as.integer(dados_alterado$casos_mm7d)
dados_alterado$obitos_pc <- as.integer(dados_alterado$obitos_pc)
dados_alterado$obitos_mm7d <- as.integer(dados_alterado$obitos_mm7d)

#Análise estatística


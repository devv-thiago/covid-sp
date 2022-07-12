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
#alterando nome das variáveis
summary(dados)
dados_alterado <- rename(dados, municipio = nome_munic, data = datahora)

#Entendendo os dados
  #criar uma nova tabela e aplicar o filtro retirando dados vazias
  #pegar a média dessa nova tabela em casos e casos_novos
  #preencher dados faltantes com a média
summary(dados_alterado$casos)
summary(dados_alterado$casos_novos)
hist(dados_alterado$casos_novos)
hist(dados_alterado$casos)

#Filtro de dados
dados_completos <- filter(dados_alterado,dados_alterado$casos != 0)
dados_completos <- filter(dados_completos,dados_completos$casos_novos != 0)
dados_completos <- filter(dados_completos,dados_completos$municipio != "Ignorado")
summary(dados_completos$municipio)

#Filtrando por municipios

#São paulo
dados_sp <- filter(dados_completos, dados_completos$municipio == "São Paulo")
hist(dados_sp$casos)
#exclusão de valores muito pequenos
dados_sp <- slice(dados_sp,-(1:4))

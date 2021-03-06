# RETO 1 

install.packages("dplyr")
install.packages("DBI")
install.packages("RMySQL")
install.packages("ggplot2")

library(dplyr)
library(DBI)
library(RMySQL)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

head(DataDB)

ESP <- DataDB %>% filter(Language == "Spanish")
class(ESP)

ESP %>% ggplot(aes( x = CountryCode, y = Percentage, fill = IsOfficial )) + 
  geom_bin2d() +
  coord_flip()


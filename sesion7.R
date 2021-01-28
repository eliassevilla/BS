# RETO 2

URL <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
data <- read_html(URL) 

tables <- html_nodes(data, "table")  

table1 <- html_table(tables[1], fill = TRUE)

table <- na.omit(as.data.frame(table1))

str(table)

a <- gsub("MXN","",table$Sueldo)
a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a <- gsub("mes", "", a)
a <- as.numeric(a)
table$Sueldo <- a

table

b <- gsub("Sueldos para Data Scientist en ", "", table$Cargo)
table$Cargo <- b

max.sueldo <- which.max(table$Sueldo)
table[max.sueldo,]

min.sueldo <- which.min(table$Sueldo)
table[min.sueldo,]

# RETO 3

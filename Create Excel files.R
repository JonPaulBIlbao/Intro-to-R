### install.packages("openxlsx")
library(openxlsx)

### Loading data fron Excel
data <- read.xlsx('Financial_Sample.xlsx')

### Calculate new variables
data$Sales     <- data$Units.Sold*data$Sale.Price
data$Sales_net <- data$Sales - data$Discounts

### Subset: sales to Canada
data_canada    <- data[data$Country=="Canada",]

### Create Excel file
write.xlsx(data_canada, "data_canada.xlsx")



### Advanced topic
### Using date to name file and saving it in a specific Google Drive Folder
### Look at the result:

Sys.Date()

### Add date to file name
name <- paste("data_canada_",Sys.Date(),".xlsx", sep="")

write.xlsx(data_canada, name)

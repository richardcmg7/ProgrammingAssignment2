library(swirl)
install_from_swirl("Getting and Cleaning Data")
if(!file.exists("data")){dir.create("data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/survey.csv", method = "curl")
dateDowloaded <- date()
install.packages("csv")
library("csv")
survey <- read.csv("./data/survey.csv") 
names(survey)
head(survey$VAL)
survey$VAL[!is.na(survey$VAL) &  survey$VAL == '24']
str(survey$VAL[!is.na(survey$VAL) &  survey$VAL == '24'])


3. 
fileUrl_2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
download.file(fileUrl_2,destfile = "./data/naturalgas.xlsx", method = "curl")
download.file(fileUrl_2,destfile="./data/naturalgas.csv", method = "curl")
install.packages("xlsx")
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./data/naturalgas.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex )
sum(dat$Zip*dat$Ext,na.rm = T)
#36534720

4. 
install.packages("XML")
library(XML)
fileUrl <- "./data/restaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
xmlValue(doc[["//zipcode"]])

rootNode<-xmlRoot(doc)
names(rootNode)
names(rootNode[[1]])
xmlSApply(rootNode,xmlValue)
zip <- xpathSApply(doc,"//zipcode",xmlValue)
str(zip)
summary(zip)
a = 0
for (i in zip){
  if (i == "21231"){
    a = a + 1
  }
}
a

5.
fileUrl_3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"
download.file(fileUrl_3,destfile = "./data/comun.csv", method = "curl")

library(data.table)
DT <- fread("./data/comun.csv")
system.time(mean(DT$pwgtp15,by=DT$SEX
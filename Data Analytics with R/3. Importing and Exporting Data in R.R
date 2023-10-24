###############Importing and Exporting Data in R#################
#######Data Types###########
#Flat Files
#Data from Excel
#Databases
#Web
#Statistical software


#Importing csv file
#read.csv()
titanic_train<-read.csv(file.choose())
class(titanic_train)
head(titanic_train)

#Using read.csv function and filename
#Set Working directory
titanic_train<-read.csv("titanic-train.csv")
class(titanic_train)

#Using read.csv and full file path
my_df<-read.csv("C:/Users/felix.odhiambo.SILKE001/Downloads/Ja4/Data Science/3. Import and export data in R/12.4 my_df.csv")
head(my_df)

#Using readr package
library(readr)
titanic_train2<-read_csv("titanic-train.csv")
head(titanic_train2)


####################IMPORT TEXT FILES######################
#Using read .table function
hotdog<-read.table("hotdog.txt", sep = "\t", header = TRUE)
head(hotdog)


#############IMPORT EXCEL FILES########################
#Using readxl Package
#Install readxl package
install.packages("readxl")

#Load the readxl package
library(readxl)

#Printout the names of spreadsheet
excel_sheets("urbanpop.xlsx")

#Read the sheets, one by one
pop_1<-read_excel("urbanpop.xlsx", sheet=1)
pop_2<-read_excel("urbanpop.xlsx", sheet=2)
pop_3<-read_excel("urbanpop.xlsx", sheet=3)

#Put pop_1, pop_2, and pop_3 into a list: pop_list
pop_list<-list(pop_1, pop_2, pop_3)

#Display the structure of pop_list
str(pop_list)


##############Importing from a Database################
#SQL Database - RMySQL package
#PostgressSQL — RPostgressSQL package
#Oracle Database — ROracle package


##############IMPORTING DATA FROM WEB##################
#Load the readr package
library(readr)

#Import the csv file: pools
url_csv<-"http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/swimming_pools.csv"
pools<-read.csv(url_csv)
head(pools)

#Import text file from web; potatoes
url_delim<-"http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/potatoes.txt"
potatoes<-read_table(url_delim)
head(potatoes)

#Importing Data from Web API & JSON
#Install jsonlite package
install.packages("jsonlite")

#Loading the package jsonlite
library(jsonlite)

fromJSON("http://www.omdbapi.com/?i=tt0095953&r=json")

##########ASSIGNMENT##############
#How to get data from facebook or twitter using R

#Importing from Statistical tool using haven package
#SAS - read_sas()
#STATA - read_stata()
#SPSS - read_spss()

#######################EXPORTING DATA IN R###############
#Exporting data to Text File
write.table(hotdog,"C:/Users/felix.odhiambo.SILKE001/Downloads/Ja4/Data Science/3. Import and export data in R/hotdognew.txt")

#Exporting to Excel
library(writexl)
my_df<-mtcars[1:3,]
write_xlsx(my_df, "C:/Users/felix.odhiambo.SILKE001/Downloads/Ja4/Data Science/3. Import and export data in R/newmtcars.xlsx")

#Expoting to csv
write.csv(my_df, "C:/Users/felix.odhiambo.SILKE001/Downloads/Ja4/Data Science/3. Import and export data in R/my_dfnew.csv")

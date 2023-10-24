mean(4,6,9,4,7,8)
mode(c(4,6,9,4,7,8))
?median
?mode

x=c(1:20)
mean(x)
sd(x)

#Numeric Function
sqrt(25)
ceiling(8.9876)

#Append
x=1:5
x
x=append(x,7)
x

#Identical
i<-5
identical(i,7)

#rep
rep(5,10)

#Unique
vec2<-c(1,1,1,2,3,3,4,4,6,5,8,6,6,9,5,3,7,7,6,9)
unique(vec2)

#Statistical Function
mean(2,3,4)
median(1:8)
sum(1:8)
sd(1:5)
range(1:5)
min(1:20)
max(1:20)

#Character Function
tolower("MENU")
toupper("manish")

#Substr
x<-"awertyu"
substr(x,2,4)

?grep
?sub
?gsub

#Paste
paste("Felix","Skanem")


#Custom Function triple
triple<-function(x){
  3*x
}
triple(9)
triple(5)

#Custom Function math_magic
math_magic<-function(a,b){
  a*b+a/b
}
math_magic(5,6)


install.packages("ggplot2")
install.packages("plyr")
install.packages("reshape2")
install.packages("sqldf")
install.packages("party")
install.packages("Hmisc")
install.packages("ggthemes")
install.packages("scales")
install.packages("mice")
install.packages("dplyr") 
install.packages("caret")
install.packages(c("rpart.plot","rstan"))
install.packages(c("praise","proto","purrr","Rcurl","reshape","RJSONIO","rmarkdown"))
install.packages(c("ROCR","roxygen2"))
install.packages(c("rprojroot","rsconnect","RSQlite","rstan","rstanarm","rstudioapi","shinydashboard","shinythemes"))

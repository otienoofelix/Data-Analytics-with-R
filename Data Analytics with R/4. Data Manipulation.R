#######################DATA MANIPULATION IN R#####################
#################Apply Function#################
#Using apply
m<-matrix(c(1,2,3,4),2,2)
m
apply(m,1,sum)
apply(m,2,sum)
apply(m,1,mean)
apply(m,2,mean)

#Using lapply - Takes list as input and returns list as output
list_one<-list(a=1:5,b=6:10,x=11:15)
lapply(list_one,sum) #Returns a list containing sum of a,b,c
lapply(list_one,mean) #Returns a list containing mean of a,b,c

#Using sapply - Similar to lapply but simplifies the result to an array
list_one<-list(a=1:5,b=6:10,x=11:15)
sapply(list_one,FUN = median)

#Using vapply - Similar to sapply but it explicitly specify the type of return value
vapply(list_one,sum, FUN.VALUE = double(1))
vapply(list_one,range,FUN.VALUE = double(2))

#Using tapply
age<-c(23:34)
gender<-c("f","f","m", "f","m","m","m","f","f","m","m","f")
f_gender<-factor(gender)
f_gender
tapply(age, f_gender,mean)
tapply(age, gender, mean)

#tapply example 2
mtcars
mtcars$wt
mtcars$cyl
f<-factor(mtcars$cyl)
f
tapply(mtcars$wt,f,mean)

#Using mapply function - multivariate version of sapply
#Without using mapply
a<-list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
a

#Using mapply
b<-mapply(rep,1:4,4:1)
b

###############Using Dplyr Package#######################
#dplyr - Powerful R-package to transform and summarize tabular data with columns and rows
#Functions: 
#select - Picks variables by their name: variable
#filter - pick observations by their values: variable
#arrange - reorder rows: observation
#mutate - create new variable from existing variable: observation
#summarize - collapse many values to a single summary: group

#install dplyr package
install.packages(dplyr)

#Load dplyr package
library(dplyr)

#install hflights package
install.packages(hflights)

#Load hflights package
library(hflights)

#Call both head() and summary() on hflights
head(hflights)
summary(hflights)
str(hflights)

#Convert data frame to table
hflights<-as_tibble(hflights)
class(hflights)

#Glimpse at hflights
dplyr::glimpse(hflights)


#########################################################################################################################
#select - Picks variables by their name: variable
tbl<-select(hflights,ActualElapsedTime, AirTime, ArrDelay, DepDelay)
glimpse(tbl)

#starts_with("x") - every name starting with x
#ends_with("x") - every name ending with x
#contains("x") - every name containing x
#matches("x") - every name that matches x
#num_range("x", 1:5) - the variables named x01, x02, x03, x04, and x05
#one_of("x") - every name that appears in x, which should be a character vector
select(hflights,ends_with("Num"))
select(hflights, starts_with("Cancel"))
select(hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancel"))

#mutate - create new variable from existing variable: observation
g1<-mutate(hflights,ActualGroundTime=ActualElapsedTime-AirTime)
glimpse(g1)

#filter - pick observations by their values: variable
#Where cancelled equals 1
can<-filter(hflights,Cancelled==1)
glimpse(can)

#All flights that traveled a distance of 3000 or more
long_flight<-filter(hflights,Distance>=3000)
glimpse(long_flight)

###############arrange - reorder rows: observation#######################
#Arrange all flights based on delay
del<-arrange(hflights,DepDelay)
head(del)

#Arrange dtc so that cancellation reasons are grouped
cance<-arrange(hflights, CancellationCode)
head(cance)

#By default, arrange() arranges the rows from smallest to largest.
#Using desc() function arranges the rows from largest to smallest.
#Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

#Arrange according to decreasing departure delays
arrange(hflights,desc(ArrDelay+DepDelay))

##############SUMMARIZE##################################################
#summarize - collapse many values to a single summary: group
#Shortest and maximum distance covered
summarise(hflights,max_dist=max(Distance),min_dist=min(Distance))

#Print out a summary of hflights with max_div: the longest distance for diverted flights
div<-filter(hflights,Diverted==1)
summarise(div, max_div=max(Distance))


# What steps do you take to print -
# only the TailNum of hflights, for flights that departed too late (DepDelay>240),sorted by total taxiing time?
#ans: First filter(), then mutate(), arrange(), and finally select()
hflight_fil<-filter(hflights,DepDelay>240)
hflight_filmut<-mutate(hflight_fil,TaxingTime=TaxiIn+TaxiOut)
hflight_filmutarr<-arrange(hflight_filmut,TaxingTime)
hflight_filmutarrsel<-select(hflight_filmutarr,TailNum)
hflight_filmutarrsel

#######################Pipe Operator %>% #######################################
hflights %>%
  filter(DepDelay>240)%>%
  mutate(TaxingTime=TaxiIn+TaxiOut)%>%
  arrange(TaxingTime)%>%
  select(TailNum)

####################group_by function###########################################
#Allows for group operations in the "split-apply-combine" concept
#Make an ordered per-carrier summary of flights
hflights%>%
  group_by(UniqueCarrier)%>%
  summarise(p_canc=mean(Cancelled==1)*100,
            avg_delay=mean(ArrDelay,na.rm = TRUE))%>%
  arrange(avg_delay,p_canc)

#Summary of hflights without per carrier
hflights%>%
  summarise(p_canc=mean(Cancelled==1)*100,
            avg_delay=mean(ArrDelay,na.rm = TRUE))%>%
  arrange(avg_delay,p_canc)

# Ordered overview of average arrival delays per carrier
# mutate() uses the rank() function, that calculates within-group rankings. 
# rank() takes a group of values and calculates the rank of each value within the group,
hflights%>%
  filter(!is.na(ArrDelay), ArrDelay>0)%>%
  group_by(UniqueCarrier)%>%
  summarise(avg=mean(ArrDelay))%>%
  mutate(rank=rank(avg))%>%
  arrange(rank)

##########################Date in R ############################################
#Default Date: 2017-01-20 or 2017/01/20
#Today's Date
today<-Sys.Date()
today

#Creating Date from character
Char_date<-"2023-10-25"
date_td<-as.Date(Char_date)
date_td
class(date_td)

#Creating Date with explicit format
as.Date("25/10/2023", format("%d/%m/%Y"))

as.Date("October 25, 2023", format("%B %d, %Y"))

#Extract the Weekdays
dates<-as.Date(c("1994-07-06","1996-08-12","2022-01-29","2023-10-25"))
weekdays(dates)

#Extract the months
months(dates)

#Extract the quarters
quarters(dates)

#Learn more packages for Dates.
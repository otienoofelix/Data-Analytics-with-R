###################LEARNING OBJECTIVES###########################
#Vector - one direction
#Matrix - two-dimensional vector
#Array
#Data frame
#list

#Numeric Vector
vec1<-1
vec2<-c(1,2,3,4) #Using combine
vec3<-(1:6) #Using colon operator
class(vec1)
vec2[2] #Accessing vector element


#Character Vector
vec_char<- c("Sun", "Moon", "Stars")
vec_char

#Logical Vector
vec_log<- c(TRUE, FALSE)
vec_log

#Matrices
mat1<-matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE)
mat1

mat1[1,] #Row 1
mat1[,1] #Column 1


#Array
Arr<-array(c(1:27),dim=c(3,3,3))
Arr
Arr[1,1,1]

Arr1<-array(1:24, dim = c(2,3,4))
Arr1


#DataFrame - used for storing data tables. A list of vectors of equal length
num=c(2,3,5)
char=c("aa", "bb", "cc")
log=c(TRUE, FALSE, TRUE)
df=data.frame(num, char, log)
df
head(df) #First several rows
tail(df) #Last several rows
str(df) #Dataframe structure
summary(df)

#Accessing column: df$
#Accessing Row: df[2,] 

#Droping a colums
#df[,-3]
#df[,-c(2,3,4)]

#Combine dataframe by row
#Use rbind()


#Combine dataframe by column
#Use cbind()


#In a data frame, character vectors are automatically converted into factors, and the
#number of levels can be determined as the number of different values in such a vector.

name<-c("joe", "john", "mercy")
sex<-c("M", "M", "F")
age<-c(27,26,25)

df<-data.frame(name, sex, age)
df
class(df)
class(df$name)
class(df$sex)
class(df$age)

#Change numeric to factor class
#df$column_name=as.factor(df$column_name)


######################LIST###########################
#May contain a combination of vectors, matrices, data frames and other lists.
#Create vector with numerics 1 to 10
my_vector<-1:10

#matrix with numerics 1 up to 9
my_matrix<-matrix(1:9, ncol=3)

#Data frame
name1<-c("John","James", "Mercy")
age<-c(26,25,60)
gender<-c("M", "M", "F")
my_df<-data.frame(name1, age, gender)

#Construct list with these different elements
my_list<-list(my_vector,my_matrix, my_df)
my_list #no namr as of now

#give name using name()
names(my_list)<-c("vec", "mat", "df")

#print out my_list
my_list



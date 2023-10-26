#########################DATA VISUALIZATION IN R################################
#Base graphics: Easiest to learn and focus of this course
#Grid graphics: powerful set of modules for building other tools
#Lattice graphics: general purpose system based on grid graphics
#Ggplot2: "the grammar of graphics"

#############Basic Visualization############################
#Scatterplots
#Line Chart
#Bar Plot
#Pie Charts
#Histograms
#Density Plot
#Box Plot

##########ScatterPlot##############
#Scatter plots help in visualizing data easily and for simple data inspection.
#Xlab = a title for the x axis
#Ylab = a title for the y axis
#Main = an overall title for the plot
#Type = Possible type of the plot (p ->point, I -> line, b ->both, s -> stair step)
#Xlim = range of X —axis
#Ylim = range of Y-axis
#plot(x,y)

#Example 1
x<-c(1,2,3,4,5)
y<-c(1,5,3,2,0)
plot(x,y)

#Example 2
dose<-c(20,30,40,50,60)
drugA<-c(16,20,27,40,60)
drugB<-c(40,31,25,18,12)
plot(dose, drugA)
plot(dose, drugB)

#type
#"p" for points,
#"l" for lines,
#"b" for both,
#"c" for the lines part alone of "b",
#"o" for both ‘overplotted’,
#"h" for ‘histogram’ like (or ‘high-density’) vertical lines,
#"s" for stair steps,
#"S" for other steps, see ‘Details’ below,
#"n" for no plotting.

#Example 3
mtcars
summary(mtcars)
max_hp<-max(mtcars$hp)
max_mpg<-max(mtcars$mpg)
plot(mtcars$hp,mtcars$mpg,
     type="p",
     ylim = c(10,max_mpg),
     xlim = c(50,max_hp),
     xlab = "HorsePower",
     ylab = "Gas Mileage",
     main = "MPG vs HorsePower")

#####################Adding Details using par() function#######################
#par can be used to set or query graphical parameters.
#view par() function
par()

#Assign the return value from the par() function to plot_pars
plot_pars<-par()

#Display the names of par() function's list elements
names(plot_pars)

#Display the number of par() function list elements
length(plot_pars)

#mfrow=c(row,col)
#Creating plot array with mfrow parameter
#Set a two-by-two plot array
par(mfrow=c(2,2))

####Using anscombe dataset####
anscombe

#Plot y1 vs. x1
plot(anscombe$y1,anscombe$x1)

#Plot y2 vs. x2
plot(anscombe$y2,anscombe$x2)

#Plot y3 vs. x3
plot(anscombe$y3,anscombe$x3)

#Plot y4 vs. x4
plot(anscombe$y4,anscombe$x4)

#Define common x and y limits for the four plots
xmin<-min(anscombe$x1,anscombe$x2,anscombe$x3,anscombe$x4)
xmax<-max(anscombe$x1,anscombe$x2,anscombe$x3,anscombe$x4)
ymin<-min(anscombe$y1,anscombe$y2,anscombe$y3,anscombe$y4)
ymax<-max(anscombe$y1,anscombe$y2,anscombe$y3,anscombe$y4)
par(mfrow=c(2,2))

#Plot y1 vs. x1
plot(anscombe$y1,anscombe$x1,
     xlim = c(xmin,xmax),
     ylim = c(ymin,ymax),
     xlab = "x value",
     ylab = "y value",
     main = "First Dataset")

#Plot y2 vs. x2
plot(anscombe$y2,anscombe$x2,
     xlim = c(xmin,xmax),
     ylim = c(ymin,ymax),
     xlab = "x value",
     ylab = "y value",
     main = "Second Dataset")

#Plot y3 vs. x3
plot(anscombe$y3,anscombe$x3,
     xlim = c(xmin,xmax),
     ylim = c(ymin,ymax),
     xlab = "x value",
     ylab = "y value",
     main = "Third Dataset")

#Plot y4 vs. x4
plot(anscombe$y4,anscombe$x4,
     xlim = c(xmin,xmax),
     ylim = c(ymin,ymax),
     xlab = "x value",
     ylab = "y value",
     main = "Fourth Dataset")

####pch - symbol to plot
mtcars
#create plot with type="n"
par(mfrow=c(1,1))
plot(mtcars$hp,mtcars$mpg,
     type = "n",
     xlim = c(0, max_hp),
     ylim = c(0,max_mpg),
     xlab = "HorsePower",
     ylab = "Miles per Gallon")

#Add solid squares to plot
points(mtcars$hp,mtcars$mpg,pch=15)

#Add open circles to plot
points(mtcars$hp,mtcars$mpg,pch=1)

#Add triangles to plot
points(mtcars$hp,mtcars$mpg,pch=2)

#Add points with shapes determined by cylinder number
points(mtcars$hp,mtcars$mpg,pch=mtcars$cyl)

#Add points with shapes as cylinder characters
points(mtcars$hp,mtcars$mpg,
       pch=as.character(mtcars$cyl))

#Add legend
legend("topright",pch = c(4,6,8),
       legend=c("4", "6", "8"))

##################Color######################
#R uses hexadecimal to represent colors
#R has 657 built in color names
colors()

##################Line Chart#################
#Preferred when analyzing a trend spread over a period of time
#Plot line chart
#Example 1
plot(AirPassengers, type="l")

#Example 2
#Create the data for the chart
v<-c(7,12,28,3,41)

#Plot the line chart
plot(v, type="o", col="red", xlab="Month", ylab="Rainfall", main="Rainfall Chart")

#Multiple lines on the same chart using line() function
#create the data for the chart
t<-c(14,7,6,19,3)
lines(t,type = "o",col="blue")

#################Creating a Bar Plot##########################
#Suitable for showing comparison between cumulative totals across several groups.
#Stacked plots are used for bar plots for various categories
counts<-table(mtcars$gear)
counts
barplot(counts,
        main = "Car Distribution", 
        xlab = "Number of Gears", 
        ylab = "count",
        legend=rownames(counts), 
        col = c("red","yellow","green"))

#Simple Horizontal barplot
barplot(counts,
        main = "Car Distribution", 
        xlab = "Number of Gears", 
        ylab = "count",
        legend=rownames(counts), 
        col = c("red","yellow","green"),
        horiz = TRUE)

#Stacked barplot with colors and legend
counts<-table(mtcars$vs,mtcars$gear)
counts
barplot(counts,
        main = "Car Distribution by Gears and V/S",
        xlab = "Number of Gears",
        col = c("skyblue","red"),
        legend=rownames(counts))

#Grouped barplot
counts<-table(mtcars$vs,mtcars$gear)
counts
barplot(counts,
        main = "Car Distribution by Gears and V/S",
        xlab = "Number of Gears",
        col = c("orange","purple"),
        legend=rownames(counts),
        beside = TRUE)


###########Creating a Pie chart######################
#Simple pie chart
slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")
pie(slices,labels = lbls,main = "Pie chart of Countries")

#Pie chart with annotated percentages
slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")
pct<-round(slices/sum(slices)*100)
lbls<-paste(paste(lbls,round(slices/sum(slices)*100)),"%",sep = "")
pie(slices,labels = lbls,main = "Pie chart of Countries",col = rainbow(length(lbls)))

#3D exploded pie chart
library(plotrix)
slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")
pie3D(slices,labels = lbls,explode = 0.1,main="3D Pie Chart")


#############Creating a histogram#####################
#Histogram is basically a plot that breaks the data into bins (or breaks) and
#shows frequency distribution of these bins.

#Simple histogram
hist(mtcars$mpg)

#Colored histogram
hist(mtcars$mpg, breaks = 15, col=rainbow(7), xlab = "Miles per Gallon", ylab = "Frequency")

#Changing bin
hist(AirPassengers,col = rainbow(7))

#Histogram of AirPassengers with 5 breakpoints
hist(AirPassengers, breaks = 5)

#Histogram by setting bins using combine function
hist(AirPassengers, breaks = c(100,300,500,700))

#Histogram by setting bins using seq(x,y,z) function
hist(AirPassengers, breaks = seq(100,700,100))

#Histogram by setting bins using combine and seq(x,y,z) functions
hist(AirPassengers, breaks = c(100,seq(200,600,150),700))


###################Creating a density plot##################
#Kernel density plot
density_data<-density(mtcars$mpg)
plot(density_data, main="Kernel Density of Miles per Gallon")
polygon(density_data,col = "skyblue",border = "black")


###################Creating a boxplot#######################
#Box Plot shows 5 statistically significant numbers- the minimum, the 25th percentile,the median, the 75th percentile and the maximum.
#It is thus useful for visualizing the spread of the data is and deriving inferences accordingly.
#Helps detect outliers - a point much different than the rest of the dataset.

#create boxplot
boxplot(mpg~cyl,
        data=mtcars, 
        main="Car Mileage Data",
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon", 
        col=(c("gold","darkgreen","blue")))


#############Advanced Visualization#########################
#Mosaic Plot
#Heat Map
#3D Graph
#Correlation Plot
#Word Cloud

##################Creating a Mosaic Plot#######################
#A mosaic plot can be used for plotting categorical data very effectively with the area of the data showing the relative proportions.
#Simple mosaic plot
data(HairEyeColor)
mosaicplot(HairEyeColor)


#################Creating a heatmap#########################
#Heat maps enable you to do exploratory data analysis with two dimensions as the axis and the third dimension shown by intensity of color.
#However you need to convert the dataset to a matrix format.
heatmap(as.matrix(mtcars),
        Rowv = NA,
        Colv = NA,
        scale = "column",
        col=cm.colors(256),
        xlab = "Attributes",
        main = "heatmap")


###############Creating 3D Graph############################
#We use the package R Commander which acts as Graphical User Interface (GUI).
#Here are the steps:
  #1.Simply install and load lattice package
  #2.Use the cloud function

#3D Scatterplot
library(lattice)
attach(iris) #3D scatterplot by factor level
cloud(Sepal.Length~Sepal.Width*Petal.Length, main="3D Scatterplot by Species")

#Example 2
library(lattice)
attach(mtcars)
cloud(hp~mpg*wt|am,
      data=mtcars,
      main="3D Scatterplot", 
      col=cyl,pch=17)


#3D graph with plotly package
install.packages("plotly")
library(plotly)
data(mtcars)

#Basic 3D Scatter Plot
plot_ly(mtcars, x=~wt,y=~hp,z=~qsec)

#Basic 3D Scatter Plot with Color

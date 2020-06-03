### Exploratory Data Analysis - Course Project 2 ###


##DATASET##

#Description: A data frame with all of the PM2.5 emissions data for 1999, 2002, 
#2005, and 2008. For each year, the table contains number of tons of PM2.5 
#emitted from a specific type of source for the entire year.

##CODE##

#Description: The following code plots a barplot of the sum of total PM2.5
#emission year by year, comparing it and showing if it has really decreased
#over the years

#import libraries
library(dplyr)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Coursera/") {
        setwd("./Exploratory Data Analysis - Coursera/")
}

#reading RDS file
NEI <- readRDS("summarySCC_PM25.rds")

#subsetting 
pm25year <- summarize(group_by(NEI, year), Emissions=sum(Emissions))
#converting total of emissions from ton to megaton (10^6 ton)
pm25year <- mutate(pm25year, Emissions = Emissions/1000000)


#plotting and saving a barplot.
png("plot1.png", width=480, height=480)
barplot(height = pm25year$Emissions, names.arg=pm25year$year, ylim = c(0,8.5),
        xlab="Years", ylab=expression('Total PM'[2.5]*' Emission [Mtons]'),
        main=expression('Total PM'[2.5]*' Emission - Comparison by Year [Mtons]'),col=7)
#Drawing at a line between 2002 and 2005, showing that the total emission has decreased
abline(h = 5.55, col = 2, lwd = 2)
dev.off() 


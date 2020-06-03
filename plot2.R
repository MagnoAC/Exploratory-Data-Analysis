### Exploratory Data Analysis - Course Project 2 ###


##DATASET##

#Description: A data frame with all of the PM2.5 emissions data for 1999, 2002, 
#2005, and 2008. For each year, the table contains number of tons of PM2.5 
#emitted from a specific type of source for the entire year.

##CODE##

#Description: The following code plots a barplot of the sum of total PM2.5
#emission in Baltimore, Maryland, year by year, comparing it and showing if 
#it has really decreased over the years.

#import libraries
library(dplyr)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Courser/") {
        setwd("./Exploratory Data Analysis - Coursera/")
}

#reading RDS file
NEI <- readRDS("summarySCC_PM25.rds")

#subsetting 
pm25year_ML <- subset(NEI, fips == "24510", c(year,Emissions))
#grouping by year
pm25year_ML <- summarize(group_by(pm25year_ML, year), Emissions=sum(Emissions))

#plotting and saving a barplot
png("plot2.png", width=480, height=480)
barplot(height = pm25year_ML$Emissions, names.arg=pm25year_ML$year, ylim = c(0,3500),
        xlab="Years", ylab=expression('Total PM'[2.5]*' Emission [Mtons]'),
        main=expression('Total PM'[2.5]*' Emission in Baltimore City/MD - Comparison by Year'),col=7)
dev.off()
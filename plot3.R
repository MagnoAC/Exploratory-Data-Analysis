### Exploratory Data Analysis - Course Project 2 ###


##DATASET##

#Description: A data frame with all of the PM2.5 emissions data for 1999, 2002, 
#2005, and 2008. For each year, the table contains number of tons of PM2.5 
#emitted from a specific type of source for the entire year.

##CODE##

#Description: The following code plots a barplot of the sum of total PM2.5
#emission in Baltimore, Maryland, year by year, comparing it by the type of 
#PM2.5 emission source.

#import libraries
library(dplyr)
library(ggplot2)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Courser/") {
        setwd("./Exploratory Data Analysis - Coursera/")
}

#reading RDS file
NEI <- readRDS("summarySCC_PM25.rds")

#subsetting by ity
pm25year_ML <- subset(NEI, fips == "24510", c(year,Emissions, type))
#grouping by year
pm25year_ML <- summarize(group_by(pm25year_ML, year, type), Emissions=sum(Emissions))

#Constructing the ggplot (barplot) panels
png("plot3.png", width=960, height=480)
g <- ggplot(pm25year_ML, aes(x=factor(year), Emissions, fill = type))
g + geom_point() + 
        xlab("Year") + ylab(expression(PM [2.5] * " Emission [tons]")) +
        ggtitle(expression("Total " * PM [2.5] * 
                           " Emission by Type of Source in Baltimore City/MD [tons]")) + 
        theme(legend.title = element_blank()) + 
        facet_grid(. ~ type) + 
        geom_col() + 
        geom_label(aes(fill = type, label = round(Emissions,2)), 
                   colour = "white", fontface = "bold")
dev.off()
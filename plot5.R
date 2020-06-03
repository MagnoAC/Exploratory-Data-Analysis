### Exploratory Data Analysis - Course Project 2 ###


##DATASET##

#Description: A data frame with all of the PM2.5 emissions data for 1999, 2002, 
#2005, and 2008. For each year, the table contains number of tons of PM2.5 
#emitted from a specific type of source for the entire year.

##CODE##

#Description: The following code plots a barplot of the sum of total PM2.5
#emission in Baltimore, Maryland, year by year, analysing the emission by 
#motor vehicles source. 

#import libraries
library(dplyr)
library(ggplot2)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Courser/") {
        setwd("./Exploratory Data Analysis - Coursera/")
}

#reading RDS file
NEI <- readRDS("summarySCC_PM25.rds")

#subsetting by motor vehicles sources
NEI_BC <- subset(NEI, fips == "24510" & type == "ON-ROAD", c(year,Emissions))
#Grouping by year and the sum of emissions.
NEI_BC_year <- summarize(group_by(NEI_BC, year), Emissions=sum(Emissions))


#making a barplot
png("plot5.png", width=480, height=480)
g <- ggplot(NEI_BC_year, aes(x=factor(year), Emissions, fill = Emissions))
g + geom_point() + 
        xlab("Year") + ylab(expression(PM [2.5] * " Emission [tons]")) +
        ggtitle(expression("Total " * PM [2.5] * 
                " Emission by Motor Vehicle Sources in Baltimore City/MD")) + 
        theme(legend.title = element_blank()) + 
        geom_col() +
        scale_fill_continuous(high = "#132B43", low = "#56B1F7") +
        geom_label(aes(fill = Emissions, label = round(Emissions,2)), 
                   colour = "white", fontface = "bold") 
dev.off()

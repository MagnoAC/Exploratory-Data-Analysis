### Exploratory Data Analysis - Course Project 2 ###


##DATASET##

#Description: 
#1 - A data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and
#2008. For each year, the table contains number of tons of PM2.5 emitted from
#a specific type of source for the entire year. 
#2 - Description of the source code used to index the source of emission.

##CODE##

#Description: The following code plots a barplot of the sum of total PM2.5
#emission in USA, year by year, analysing the emission by a coal 
#combustion-related source. 

#import libraries
library(dplyr)
library(ggplot2)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Courser/") {
        setwd("./Exploratory Data Analysis - Coursera/")
}

#reading RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting only the coal related source groups.
SCC_coal <- subset(SCC,grepl("Coal", EI.Sector) == TRUE, SCC)
#making the subsetted values match with the NEI df
NEI_coal <- NEI[(NEI$SCC %in% SCC_coal$SCC),]
#creating the tidy df to be plotted
NEI_coalyear <- summarize(group_by(NEI_coal, year), Emissions=sum(Emissions)/1000)

#Constructing the ggplot (barplot)
png("plot4.png", width=480, height=480)
g <- ggplot(NEI_coalyear, aes(x=factor(year), Emissions, fill = Emissions))
g + geom_point() + 
        xlab("Year") + ylab(expression(PM [2.5] * " Emission [ktons]")) +
        ggtitle(expression("Total " * PM [2.5] * 
                " Emission by Coal Combustion-Related Source ")) + 
        theme(legend.title = element_blank()) + 
        geom_col() +
        scale_fill_continuous(high = "#132B43", low = "#56B1F7") +
        geom_label(aes(fill = Emissions, label = round(Emissions,2)), 
                   colour = "white", fontface = "bold") 
dev.off()


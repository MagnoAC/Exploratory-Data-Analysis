# Exploratory-Data-Analysis
Projects envolving Exploratory Data Analysis and Graphs

Data used on this work
* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"> Data for Peer Assessment [29Mb] 
</a>

The zip file contains two files:

* PM2.5 Emissions Data: This file contains a data frame with all 
of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 
emitted from a specific type of source for the entire year.

* Source Classification Code Table: 
This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. 
The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever
categories you think are most useful. For example, source “10100101” is known as 
“Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

### Questions Answered ###

<b>1</b> -Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of 
the years 1999, 2002, 2005, and 2008. (plot1.R, plot1.png)

<b>2</b> - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? 
Use the base plotting system to make a plot answering this question. (plot2.R, plot2.png)

<b>3</b> - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
Use the ggplot2 plotting system to make a plot answer this question. (plot3.R, plot3.png)

<b>4</b> - Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
(plot4.R, plot4.png)

<b>5</b> - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? (plot5.R, plot5.png)

<b>6</b> - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
California . Which city has seen greater changes over time in motor vehicle emissions? (plot6.R, plot6.png)

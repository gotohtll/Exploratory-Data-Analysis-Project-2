
if(!exists("NEI")){
  NEI <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")
}
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
# for each of the years 1999, 2002, 2005, and 2008.
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)
png(filename = "Plot1.png", width = 480, height = 480)
dev.copy(png, file = "C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Plot1.png")
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()


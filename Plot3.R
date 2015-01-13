
if(!exists("NEI")){
  NEI <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")
}
library(ggplot2)

subsetNEI <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)
png(filename = "Plot3.png", width = 480, height = 480)
dev.copy(png, file = "C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Plot3.png")
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()



if(!exists("NEI")){
  NEI <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")
}
# merge the two data sets
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}
library(ggplot2)
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
png(filename = "Plot6.png", width = 1040, height = 480)
dev.copy(png, file = "C:/Users/Admin/R Files/Exploratory Data Analysis Project 2/Plot6.png")
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037") 1999-2008')
print(g)
dev.off()


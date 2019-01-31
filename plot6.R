## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Subset data from Baltimore City, LA county and from type "on road"
BLACarData <- subset(EmissionsData, EmissionsData$fips=="24510" |
                                  EmissionsData$fips=="06037" &
                                  EmissionsData$type=="ON-ROAD")
BLACarYear <- aggregate(BLACarData$Emissions, 
                             by=list(BLACarData$fips, BLACarData$year),
                             FUN=sum)
colnames(BLACarYear) <- c("City", "Year", "Emissions")

## Plotting the Data
library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = BLACarYear, color = City, geom = "line") +
        ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
        ylab("Total Emissions from motor vehicles (tons)") + 
        xlab("Year") 
dev.off()

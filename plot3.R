## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Subset the data from Baltimore and then add up emissions by variable Type
BaltimoreData <- subset(EmissionsData, EmissionsData$fips=="24510")
BaltimoreDataTypeYear <- aggregate(BaltimoreData$Emissions, by=list(BaltimoreData$type, BaltimoreData$year), 
                                   FUN=sum)
colnames(BaltimoreDataTypeYear) <- c("Type", "Year", "Emissions")
                                   
## Plotting the Data
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = BaltimoreDataTypeYear, color = Type, geom = "line") +
        ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
        ylab("Total Emissions (tons)") + 
        xlab("Year") 
dev.off()

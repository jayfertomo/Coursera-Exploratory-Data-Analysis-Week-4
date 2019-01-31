## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Subset data from Baltimore City from type "on road"
BaltimoreCarData <- subset(EmissionsData, EmissionsData$fips=="24510" 
                         & EmissionsData$type=="ON-ROAD")
BaltimoreCarYear <- aggregate(BaltimoreCarData$Emissions, 
                                by=list(BaltimoreCarData$year), FUN=sum)
colnames(BaltimoreCarYear) <- c("Year", "Emissions")

## Plotting the Data
png(filename = "plot5.png")
plot(BaltimoreCarYear$Year, BaltimoreCarYear$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()

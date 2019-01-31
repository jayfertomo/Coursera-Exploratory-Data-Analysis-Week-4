## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Subset the data from Baltimore and then add up emissions for each year
BaltimoreData <- subset(EmissionsData, EmissionsData$fips=="24510")
BaltimoreDataYear <- aggregate(BaltimoreData$Emissions, by=list(BaltimoreData$year), 
                                   FUN=sum)
## Plotting the Data
png(filename = "plot2.png")
plot(BaltimoreDataYear$Group.1, BaltimoreDataYear$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()

## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Adding up the Total Emissions Each Year
SumEmissions <- aggregate(EmissionsData$Emissions, by=list(year=EmissionsData$year), FUN=sum)

## Plotting the Data
png(filename = "plot1.png")
plot(SumEmissions$year, SumEmissions$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()

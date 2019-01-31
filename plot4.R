## Reading the files
EmissionsData <- readRDS("summarySCC_PM25.rds")
Class_Code <- readRDS("Source_Classification_Code.rds")

## Get all Records with "coal"
CoalClassCode <- Class_Code[grepl("Coal", Class_Code$Short.Name), ]
CoalEmissionsData <- EmissionsData[EmissionsData$SCC %in% CoalClassCode$SCC, ]

## Adding Emissions by Year
CoalEmissionsYear <- aggregate(CoalEmissionsData$Emissions, 
                                 by=list(CoalEmissionsData$year), FUN=sum)
colnames(CoalEmissionsYear) <- c("year", "emissions")

## Plotting the data
png(filename = "plot4.png")
plot(CoalEmissionsYear$year, CoalEmissionsYear$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()

## **********************************************************************************
## PLOT 6
library(ggplot2)
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SXC <- readRDS("Source_Classification_Code.rds")
EA <- grep("vehicle",SXC$EI.Sector,value=T,ignore.case=T)
SXC.EA <- subset(SXC, SXC$EI.Sector %in% EA, select=SCC)
BC.LA <- subset(NEI, fips == "24510"|fips == "06037")
NEI.EA <- subset(BC.LA, BC.LA$SCC %in% SXC.EA$SCC)
pea <- aggregate(NEI.EA[c("Emissions")], list(fips = NEI.EA$fips, year = NEI.EA$year), sum)
pea$city <- rep(NA, nrow(pea))
pea[pea$fips == "06037", ][, "city"] <- "Los Angles County"
pea[pea$fips == "24510", ][, "city"] <- "Baltimore City"
# Create Plot
library(ggplot2)
png('plot6.png', width=480, height=480)
p <- ggplot(pea, aes(x=year, y=Emissions, colour=city)) +
geom_point(alpha=.3) +
geom_smooth(alpha=.2, size=1, method="loess") +
ggtitle("Vehicle Emissions in Baltimore vs. LA")
print(p)
dev.off()
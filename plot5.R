## **********************************************************************************
## PLOT 5
library(ggplot2)
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SXC <- readRDS("Source_Classification_Code.rds")
EA <- grep("vehicle",SXC$EI.Sector,value=T,ignore.case=T)
SXC.EA <- subset(SXC, SXC$EI.Sector %in% EA, select=SCC)
BC <- subset(NEI, fips == "24510")
NEI.EA <- subset(BC, BC$SCC %in% SXC.EA$SCC)
pea <- aggregate(NEI.EA[c("Emissions")], list(year = NEI.EA$year), sum)
# Create Plot
png('plot5.png', width=480, height=480)
plot(pea$year, pea$Emissions, type = "l",
main = "Total Vehicle Emissions in Baltimore City",
xlab = "Year", ylab = "Emissions")
dev.off()


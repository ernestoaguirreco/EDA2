## ******************************************************
## plot 4
library(ggplot2)
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SXC <- readRDS("Source_Classification_Code.rds")
EA <- grep("coal",SXC$EI.Sector,value=T,ignore.case=T)
SXC.EA <- subset(SXC, SXC$EI.Sector %in% EA, select=SCC)
NEI.EA <- subset(NEI, NEI$SCC %in% SXC.EA$SCC)
pea <- aggregate(NEI.EA[c("Emissions")], list(year = NEI.EA$year), sum)
# Create Plot
png('plot4.png', width=480, height=480)
p <- ggplot(pea, aes(x=year, y=Emissions)) +
geom_point(alpha=.3) +
geom_smooth(alpha=.2, size=1) +
ggtitle("Total PM2.5 Coal Combustion Emissions in USA")
print(p)
dev.off()
## ******************************************************
## Plot 3
library(ggplot2)
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
NEI <- readRDS("summarySCC_PM25.rds")
Be <- subset(NEI, fips == "24510") 
pea <- aggregate(Be[c("Emissions")], list(type = Be$type, year = Be$year), sum)
png('plot3.png', width=480, height=480)
p <- ggplot(pea, aes(x=year, y=Emissions, colour=type)) +
geom_point(alpha=.3) +
geom_smooth(alpha=.2, size=1, method="loess") +
ggtitle("Total Emissions by Type in Baltimore City")
print(p)
dev.off()
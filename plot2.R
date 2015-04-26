## ************************************************************
## plot 2
setwd("c:/R-Neto/data/datos")
getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","c:/R-Neto/data/datos/hhh.zip")
unzip("hhh.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
bal <- NEI[NEI$fips=="24510",]
ag <- aggregate(Emissions ~ year, bal,sum)
png("plot2.png",width=480,height=480,units="px",bg="transparent")
barplot(
  ag$Emissions,
  names.arg=ag$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)
dev.off()
# Plot 1 

# Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, make a plot showing the total 
#PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
library("dplyr")

str(NEI)

# subset by year 
sub_1999 <- subset(NEI, year = 1999)
sub_2002 <- subset(NEI, year == 2002)
sub_2005 <- subset(NEI, year == 2005)
sub_2008 <- subset(NEI, year == 2008)

# sum PM2.5 from all sources 
total_1999 <-sum(sub_1999$Emissions)
total_2002 <-sum(sub_2002$Emissions)
total_2005 <-sum(sub_2005$Emissions)
total_2008 <-sum(sub_2008$Emissions)

# plot 
names(total_1999) <- "1999"
names(total_2002) <- "2002"
names(total_2005) <- "2005"
names(total_2008) <- "2008"

all_totals <- c(total_1999, total_2002, total_2005, total_2008)
barplot(all_totals, xlab = "Year", ylab = "Total PM2.5 emissions from all sources", col = "maroon1", ylim = c(0, 22000000))

dev.copy(png, "Plot 1.png")
dev.off()

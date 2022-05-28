#Have total emissions from PM2.5 decreased in the Baltimore
#City, Maryland from 1999 to 2008? Use the base plotting system 
#to make a plot answering this question.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
library("dplyr")

sub_1999 <- subset(NEI, year = 1999)
sub_2002 <- subset(NEI, year == 2002)
sub_2005 <- subset(NEI, year == 2005)
sub_2008 <- subset(NEI, year == 2008)

bc_1999 <- subset(sub_1999, fips == 00510)


# Plot 2 

install.packages("dplyr")

sub_1999 <- subset(NEI, year == 1999 & fips == 24510)
sub_2002 <- subset(NEI, year == 2002 & fips == 24510)
sub_2005 <- subset(NEI, year == 2005 & fips == 24510)
sub_2008 <- subset(NEI, year == 2008 & fips == 24510)

sum99 <- sum(sub_1999$Emissions)
sum02 <- sum(sub_2002$Emissions)
sum05 <- sum(sub_2005$Emissions)
sum08 <- sum(sub_2008$Emissions)

names(sum99) <- "1999"
names(sum02) <- "2002"
names(sum05) <- "2005"
names(sum08) <- "2008"

all <- c(sum99, sum02, sum05,sum08)
barplot(all, xlab = "Year", ylab=" Total PM2.5 emissions from all sources",
        main="Total emissions from PM2.5 in Baltimore City from 1999 to 2008")

dev.copy(png, "Plot 2.png")        
dev.off() 

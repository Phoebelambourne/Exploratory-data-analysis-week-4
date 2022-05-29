# Plot 4 

# Across the United States, how have
# emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

library("dplyr")
library("tidyr")

SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]

head(NEIcoal)
tail(NEIcoal)

byyear <- NEIcoal %>%
  group_by(year) %>%
  summarise(sum(Emissions)) %>%
  rename(Emissions = 'sum(Emissions)')

byyear

ggplot(byyear, aes(x = year, y = Emissions)) + geom_line() + 
  ggtitle(expression("Total PM2.5 Emissions from coal combustion-related sources"))

dev.copy(png, "Plot 4.png")
dev.off() 

# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California. Which city has seen greater 
# changes over time in motor vehicle emissions?


vehiclesbmla <- NEI %>%
  subset(fips == '24510' | fips == '06037') %>%
  subset(type == 'ON-ROAD')

sumsbyear <- vehiclesbmla %>% 
  group_by(fips, year) %>% 
  summarise(sum(Emissions)) %>%
  rename(Emissions = 'sum(Emissions)') 

sumsbyear

ggplot(sumsbyear, aes(x = year, y = Emissions, col = fips)) + geom_line() +
  labs(title = "Baltimore and Los Angeles PM2.5 Motor Vehicle Emissions") +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))

dev.copy(png, "Plot 6.png")       
dev.off()       

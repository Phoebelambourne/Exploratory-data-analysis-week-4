# Plot 5

# How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City?

vehiclesbm <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
SCConroad <- subset(SCC, Data.Category == 'Onroad')

merged <- merge(vehiclesbm, SCConroad, by = 'SCC')

sums <- merged %>% 
   group_by(SCC.Level.Three, year) %>% 
   summarise(sum(Emissions)) %>%
   rename(Emissions = 'sum(Emissions)') %>% 
   rename(SCC = 'SCC.Level.Three')

head(sums)

ggplot(sums, aes(x = year, y = Emissions, col = SCC)) 
+ geom_line() + ggtitle(expression("Emissions from Motor Vehicle Sources in Baltimore City"))

totalsums <- merged %>% 
  group_by(year) %>% 
  summarise(sum(Emissions)) %>% 
  rename(Emissions = 'sum(Emissions)')

dev.copy(png, "Plot 4a.png")
dev.off()

ggplot(totalsums, aes(x = year, y = Emissions)) +
  geom_line() + ggtitle(expression(" Total Emissions 
                        from Motor Vehicle Sources in Baltimore City"))

dev.copy(png, "Plot 4b.png")  
dev.off()  


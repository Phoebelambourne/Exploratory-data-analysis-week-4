# Plot 3 

# Of the four types of sources indicated by the type 
# variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? Which have seen 
# increases in emissions from 1999–2008? Use the ggplot2 plotting system 
# to make a plot answer this question.


library(tidyr)
library(dplyr)

# Sum emissions for each type by year 

point <- NEI %>%
  subset(type == "POINT") %>%
  subset(fips == '24510') %>%
  group_by(year) %>%
  summarise(sum(Emissions))

nonpoint <- NEI %>%
  subset(type == "NONPOINT") %>%
  subset(fips == '24510') %>%
  group_by(year) %>%
  summarise(sum(Emissions))

onroad <- NEI %>%
  subset(type == "ON-ROAD") %>%
  subset(fips == '24510') %>%
  group_by(year) %>%
  summarise(sum(Emissions))

nonroad <- NEI %>%
  subset(type == "NON-ROAD") %>%
  subset(fips == '24510') %>%
  group_by(year) %>%
  summarise(sum(Emissions))


point <- rename(point, Point = `sum(Emissions)`) 
nonpoint <- rename(nonpoint, 'Non-Point'  = `sum(Emissions)`)
onroad <- rename(onroad, 'On-Road'  = `sum(Emissions)`)
nonroad <- rename(nonroad, 'Non-Road' = `sum(Emissions)`)


# Can I do the above in one command?

# Plot - base 
par(mfcol = c(2,2))
plot(point, type = "l", ylab = "Emissions", main = "Point")
plot(nonpoint, type = "l", ylab = "Emissions", main = "Non-Point")
plot(onroad, type = "l", ylab = "Emissions", main = "On-Road")
plot(nonroad, type = "l", ylab = "Emissions", main = "Non-Road")

# Plot - ggplot 

joinedp <- left_join(point, nonpoint, by = 'year')
joinedr <- left_join(onroad, nonroad, by = 'year')
merged <- left_join(joinedp, joinedr, by = 'year')
head(merged)

longer_data <- merged %>% 
  pivot_longer(Point:`Non-Road`, names_to = "type", values_to = "Emissions")

longer_data
library(ggplot2)

ggplot(longer_data, aes(year, Emissions, col = type)) + geom_line() + 
  geom_point() + ggtitle(expression("Total PM2.5 Emissions in Baltimore")) + scale_colour_discrete(name = "Type of sources")

dev.copy(png, "Plot 3.png")
dev.off()





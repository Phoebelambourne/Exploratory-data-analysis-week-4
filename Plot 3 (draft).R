# Plot 3 

library(tidyr)
library(dplyr)

# Sum emissions for each type by year 
point <- NEI %>%
  subset(type == "POINT") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

nonpoint <- NEI %>%
  subset(type == "NONPOINT") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

onroad <- NEI %>%
  subset(type == "ON-ROAD") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

nonroad <- NEI %>%
  subset(type == "NON-ROAD") %>%
  group_by(year) %>%
  summarise(sum(Emissions))

point <- rename(point, Emissions.P = `sum(Emissions)`) 
nonpoint <- rename(nonpoint, Emissions.NP  = `sum(Emissions)`)
onroad <- rename(onroad, Emissions.NR   = `sum(Emissions)`)
nonroad <- rename(nonroad, Emissions.ON  = `sum(Emissions)`)



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
  pivot_longer(Emissions.P:Emissions.ON, names_to = "type", values_to = "Emissions")

longer_data
library(ggplot2)

# Stuck here at how to plot year by emissions, for each type









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

rename(point, Emissions = `sum(Emissions)`) 
rename(nonpoint, Emissions = `sum(Emissions)`)
rename(onroad, Emissions = `sum(Emissions)`)
rename(nonroad, Emisions = `sum(Emissions)`)

# Can I do the above in one command?

# Plot - base 
par(mfcol = c(2,2))
plot(point, type = "l", ylab = "Emissions", main = "Point")
plot(nonpoint, type = "l", ylab = "Emissions", main = "Non-Point")
plot(onroad, type = "l", ylab = "Emissions", main = "On-Road")
plot(nonroad, type = "l", ylab = "Emissions", main = "Non-Road")

# Plot - ggplot 





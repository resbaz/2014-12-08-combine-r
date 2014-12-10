# plyr demo

library("plyr")

# Get the data
data <- read.csv(
  "gapminder-FiveYearData.csv", 
  stringsAsFactors=FALSE 
)
# Get the subset of the data for the year 1982
data.1982 <- data[data$year == 1982,]

print(
  ddply(data.1982, .(continent), function(subset) {
    mean(subset$pop)
  })
)

print(
  ddply(data, .(continent, year), function(subset) {
    mean(subset$pop)
  })
)





library("RColorBrewer")

# Get the data
data <- read.csv(
  "gapminder-FiveYearData.csv", 
  stringsAsFactors=FALSE 
)
# Get the subset of the data for the year 1982
data.1982 <- data[data$year == 1982,]

# A function to penalise outliers in a set of points, for
# example, gdp, where many countries have a small GDP, 
# while only a few have a large GDP. So we want to 
# apply a transform points like these to more easily
# visualise the spread in the data
#
# The benefit of putting this in a function is that
# it makes it easier to come back and change the 
# definition later, for example if we want to 
# change it to the sqrt function.
penalize <- function(gdp) {
  log10(gdp)
}

# Scale points to population size
# 1. Convert size to be between 0 and 1
# 2. Range; what range should the point sizes fall between?
#
rescale <- function(population, range=c(0.2,10)) {
  scaled <- sqrt(population)
  # Scaling the population to be between 0 and 1.
  point.size <- (population - min(population)) / 
                (max(population) - min(population))
  point.size <- range[1] + point.size * (range[2] - range[1])
  point.size
}

# Color a set of points by the categories they fall into
# 
# The first argument should be a *character vector*, for
# example the "continent" column of our data.
#
# The second argument, brewer.palette, has been given a 
# default value.
color.mapping <- function(categories, brewer.palette="Set1") {
  # Since we know we need a function from the RColorBrewer
  # package, we should check that the package is available
  require(RColorBrewer)
  
  # How many categories are their?
  nCategories <- length(unique(categories))
  
  # We use the second argument of our function, as an argument to
  # the brewer.pal function, which comes from the RColorBrewer
  # package.
  # 
  # color.table will contain the same number of colors as there
  # are categories
  color.table <- brewer.pal(
    n=nCategories, name=brewer.palette
  ) 
  
  # Now that we've set the names to be the unique categories,
  # we now have a mapping between each category and a unique
  # color
  names(color.table) <- unique(categories)
  
  # Now we want to return the color mapping
  return(color.table)
}


color.table <- color.mapping(data$continent)

par(mar=c(5,4,1,1)+0.1)
plot(
  x=penalize(data.1982$gdpPercap),          # x coordinate for each point
  y=data.1982$lifeExp,                      # y coordinate for each point
  xlab="GDP per capita",                    # Label for the x-axis
  ylab="Life Expectancy (years)",           # Label for the y-axis
  cex = rescale(data.1982$pop, c(1, 10)),   # point size on the plot
  pch = 21,                                 # Symbol to use for the point
  col = "black",                            # color of the point symbol border
  bg = color.table[data.1982$continent],    # background color of the point symbol
  las = 2                                   # Make the axis tick labels perpendicular                     
) 

# add a legend
legend(
  "bottomright",                # location on the plot to draw the legend 
  legend = names(color.table),  # Names on the legend
  fill = color.table            # color for each name
)

# lm gives the model fit.
l1 <- lm(
  lifeExp ~ penalize(gdpPercap),
  data=data.1982
)
# Add the line of the fit
abline(l1, col="orange", lwd=2) # lwd: line width

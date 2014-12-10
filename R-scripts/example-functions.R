# This doubles a number
double <- function(number) {
  print(number + number)
  print("hello")
}

my.mean <- function(x, ...) {
  mean(x, ...)
}

# Write a function that takes two numbers (x and y)
# as an argument and: 
#    1. Prints the numbers 
#    2. Prints the sum of the two numbers 
#    3. Prints log x base y 
#    4. Returns the phrase 
#        "Writing functions is easy!"
my.func <- function(x, y) {
  text <- paste(x, y)
  print(text)
  new.number <- sum(x, y)
  print(new.number)
  print(log(x, y))
  return("Writing functions is easy!")
}

# With defaults
my.func1 <- function(x, y=5) {
  text <- paste(x, y)
  print(text)
  new.number <- sum(x, y)
  print(new.number)
  print(log(x, y))
  return("Writing functions is easy!")
}

sum <- function(x, y) {
  x + y 
}
#STEP1
#Get a data set from the web: "electric vehicle population data" 
myDataSet <- read.csv("C:/Electric_Vehicle_Population_Data.csv")
head(myDataSet)

#STEP 2
#See if generic function can be applied on the data set
#EXPLAIN 
summary(myDataSet)


#STEP 3
#explore if s3 and s4 object types can be applied to my data set 
#s3 object test
class(myDataSet)
#s4 object test
isS4(myDataSet)



#How do you determine the base type (like integer or list) of an object?
typeof(myDataSet)

#create two examples of S3 and S4

### Define a constructor function for S3 object###
electric_vehicle <- function(make, model, year, type) {
  obj <- list(make = make, model = model, year = year, type = type)
  class(obj) <- "electric_vehicle"
  return(obj)
}

# Create an S3 object
ev1 <- electric_vehicle("Tesla", "Model S", 2022, "BEV")

# Define a method for printing the object
print.electric_vehicle <- function(ev) {
  cat("Electric Vehicle:\n")
  cat("Make:", ev$make, "\nModel:", ev$model, "\nYear:", ev$year, "\nType:", ev$type, "\n")
}

# Test the method
print(ev1)


### Define an S4 class###
setClass("ElectricVehicle", 
         slots = c(make = "character", model = "character", year = "numeric", type = "character"))

# Create an S4 object
ev2 <- new("ElectricVehicle", make = "Tesla", model = "Model X", year = 2023, type = "BEV")

# Define a method for showing the object
setMethod("show", "ElectricVehicle", function(object) {
  cat("Electric Vehicle:\n")
  cat("Make:", object@make, "\nModel:", object@model, "\nYear:", object@year, "\nType:", object@type, "\n")
})

# Test the method
show(ev2)


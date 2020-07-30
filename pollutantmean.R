rm(list = ls())
setwd("C:/Users/User/Desktop/Coursera/rprog_data_specdata")

#Directory is a character vector of length 1 indicating location of csv files
#Pollutant is a character vector of length 1 indicating the name of pollutants
#Id is an integer vector indicate to read the ID numbers to be used
#Returns the mean of the pollutant across all monitor list in the 'id' vector (ignoring NAs)
 
pollutantmean <- function(directory, pollutant, id = 1:332) {

#Define a vector to keep values
vector <- c()

#Define a loop over IDs
for(i in id){

#Define a path
path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")

#Load the data and read files        
full_data <- read.csv(path)

#Select the Coloumn of Interest
data <- full_data[pollutant]

#Append a vector and ignore the missing values i.e. NAs
vector <- c(vector, data[!is.na(data)])
}
#Return the mean values to 3 decimal places    
round(mean(vector),3)
}
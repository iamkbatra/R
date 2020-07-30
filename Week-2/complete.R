rm(list = ls())
setwd("C:/Users/User/Desktop/Coursera/rprog_data_specdata")

#Directory is a character vector of length 1 indicating location of csv files
#Id is an integer vector indicate to read the ID numbers to be used
#Returns a data frame of the form:
#Id nobs
#1  117
#2  1041
# ... where 'id' is the monitor ID number and 'nobs' is the number of complete cases
 
complete <- function(directory, id = 1:332) {

#Define or initialize varibales
ids <- vector()
nobs = vector()

#Define a loop over IDs
for(i in id){

#Define a path
path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")

#Load the data and read files        
full_data <- read.csv(path)

#Store the ID
ids <- c(ids, i)

#Count of Complete Cases
complete_cases <- full_data[complete.cases(full_data),]
nobs <- c(nobs, nrow(complete_cases))
}

#Return the data frame
return(data.frame(cbind(id, nobs)))
}
rm(list = ls())
setwd("C:/Users/User/Desktop/Coursera/rprog_data_specdata")

#Directory is a character vector of length 1 indicating location of csv files
#Threshold' is a numeric vector of length 1 indicating the no, of completely observed 
#Observations (on all variables) required to compute the correlation between
#Nitrate and Sulfate; the default is 0
 
corr <- function(directory, threshold = 0) {

#Define or initialize varibales
correlations <- c()

#Define a path
files <- (Sys.glob("specdata//*.csv"));

#Define a loop over IDs
for(i in files){

#Load the data and read files  
file_data <- read.csv(i, sep = ",");

#Count of Complete Cases
complete_cases <- file_data[complete.cases(file_data),];
if (nrow(complete_cases) > threshold) {
correlations <- c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
}
}
return(correlations)
}
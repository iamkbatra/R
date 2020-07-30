#Define a path to read the data from your system
rm(list = ls())
setwd("C:/Users/User/Desktop/Coursera/rprog_data_ProgAssignment3-data")

#Define a path to read the data from your system
rm(list = ls())
setwd("C:/Users/User/Desktop/Coursera/rprog_data_ProgAssignment3-data")

#Define a path of a directory to read csv files
directory <- "./outcome-of-care-measures.csv"

#Create a function that signifies ranking hospitals in all states
rankall <- function(outcome, num = "best") {

#Read outcome data
data <- read.csv(directory, colClasses = "character")

#Simplify the column names
data <- data[c(2, 7, 11, 17, 23)]
names(data)[1] <- "name"
names(data)[2] <- "state"
names(data)[3] <- "heart attack"
names(data)[4] <- "heart failure"
names(data)[5] <- "pneumonia"

#Validate the outcome string
outcomes = c("heart attack", "heart failure", "pneumonia")
if(outcome %in% outcomes == FALSE) stop("invalid outcome")

#Validate the num value
if(num != "best" && num != "worst" && num%%1 != 0) stop("invalid num")

#Select only rows with outcome data	
data <- data[data[outcome] != 'Not Available', ]
    
#Order the data
data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
data <- data[order(data$name, decreasing = FALSE), ]
data <- data[order(data[outcome], decreasing = FALSE), ]

#Define a function to process the num argument
getHospByRank <- function(df, s, n) {
df <- df[df$state==s, ]
vals <- df[, outcome]
if( n == "best" ) {
rowNum <- which.min(vals)
} else if(n == "worst") {
rowNum <- which.max(vals)
} else {
rowNum <- n
}
df[rowNum, ]$name
}

#Find the hospital of the given rank in each state
states <- data[, 2]
states <- unique(states)
newdata <- data.frame("hospital"=character(), "state"=character())
for(st in states) {
hosp <- getHospByRank(data, st, num)
newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
}

#Return the hospital names and the state name abbreviated
newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
newdata
}
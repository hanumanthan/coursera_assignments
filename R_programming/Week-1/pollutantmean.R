pollutantmean <- function(directory, pollutant, id = 1:332) {
 for(i in id) {
   monitorId <- formatC(i, width=3, flag="0") 
   fileName <- paste(directory, "/", monitorId, ".csv", sep="")
   inputData <- read.csv(fileName, header=TRUE)
   if(!exists('pollutantData')) {
     pollutantData <- inputData[,pollutant]  
   } else {
     pollutantData <- c(pollutantData, inputData[,pollutant])
   }
 }
 mean(pollutantData, na.rm='true')
}
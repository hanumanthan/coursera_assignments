complete <- function(directory, id = 1:332) {
  for(i in id) {
    monitorId <- formatC(i, width=3, flag="0") 
    fileName <- paste(directory, "/", monitorId, ".csv", sep="")
    inputData <- read.csv(fileName, header=TRUE)
    if(!exists('obs')) {
      obs <- nrow(inputData[complete.cases(inputData),])
    } else {
      obs <- c(obs, nrow(inputData[complete.cases(inputData),]))
    }
   }
  data.frame(id,nobs=obs)
}

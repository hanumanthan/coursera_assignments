rankhospital <- function(state, outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(data[,7])
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% states) stop("invalid state")
  if (!outcome %in% outcomes) stop("invalid outcome")
  stateData <- data[data$State == state,]
  if(outcome == outcomes[1]) {
    hospitalByOrder(11, stateData, num)
  }else if(outcome == outcomes[2]) {
    hospitalByOrder(17, stateData, num)
  }else {
    hospitalByOrder(23, stateData, num)
  }
}

hospitalByOrder <- function(index, stateData, num) {
  stateData[,index] <- as.numeric(stateData[,index])
  stateData <- stateData[complete.cases(stateData),]
  orderedData <- stateData[order(stateData[,index], stateData$Hospital.Name),]
  if(num == "best") return(orderedData$Hospital.Name[1])
  else if (num == "worst") return(orderedData$Hospital.Name[length(orderedData$Hospital.Name)])
  else if(num > length(orderedData$Hospital.Name)) return(NA)
  else return(orderedData$Hospital.Name[num])
}
rankall <- function(outcome, num = "best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- sort(unique(data[,7]))
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  hospital <- character()
  if (!outcome %in% outcomes) stop("invalid outcome")
  for(i in seq_along(states)) {
    stateData <- data[data$State == states[i],]
    if(outcome == outcomes[1]) {
      hospital <- c(hospital, hospitalByOrder(11, stateData, num))
    }else if(outcome == outcomes[2]) {
      hospital <- c(hospital, hospitalByOrder(17, stateData, num))
    }else {
      hospital <- c(hospital, hospitalByOrder(23, stateData, num))
    }
  }
  data.frame(hospital, state=states)
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
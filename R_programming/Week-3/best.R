best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- unique(data[,7])
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% states) stop("invalid state")
  if (!outcome %in% outcomes) stop("invalid outcome")
  stateData <- data[data$State == state,]
  minDeathRate <- 0
  if(outcome == outcomes[1]) {
    hospitalByMinDeathRate(as.numeric(stateData[,11]), stateData)
  }else if(outcome == outcomes[2]) {
    hospitalByMinDeathRate(as.numeric(stateData[,17]), stateData)
  }else {
    hospitalByMinDeathRate(as.numeric(stateData[,23]), stateData)
  }
}

hospitalByMinDeathRate <- function(deathRateByState, stateData) {
  minDeathRate <- min(deathRateByState, na.rm="TRUE")
  hospitals <- stateData$Hospital.Name[deathRateByState == minDeathRate]
  if(length(hospitals) == 1) return(hospitals)
  else return(sort(hospitals)[1])
}

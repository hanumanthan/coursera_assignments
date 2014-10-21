corr <- function(directory, threshold = 0) {
  files <- list.files(path=directory)
  correlation <- {};
  for (i in seq_along(files)) {
    fileName <- paste(directory, "/", files[i], sep="")
    inputData <- read.csv(fileName, header=TRUE)
    if(nrow(inputData[complete.cases(inputData),]) >= threshold) {
      correlation <- c(correlation, cor(inputData[2], inputData[3], use="pairwise.complete.obs"))
    }
  }
  correlation
}
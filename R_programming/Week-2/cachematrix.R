## This R script contains functions that can cache its inverse and return the cached inverse 
## Functions present in this script are makeCacheMatrix and cacheSolve

## This function creates a special "matrix" object that can cache its inverse. It exposes two functions
## getinv to provide cached inverse and calculateinv which calculates the inverse, stores in cache 
## and returns the value
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    getinv <- function() inv
    calculateinv <- function() {
      inv <<- solve(x)
      inv
    }
    list(getinv=getinv, calculateinv= calculateinv)
  
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  inv <- x$calculateinv()
  inv
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  a <- NULL
  set <- function(y) {
    x <<- y
    a <<- NULL
  }
## This step is to set loop for a, the inverse
  get <- function() x
  setsolve <- function(solve) a <<- solveMatrix
  getsolve <- function() a
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}
## This step is to compute the inverse of the matrix
cacheSolve <- function(x, ...) {
  a <- x$getsolve()
  if(!is.null(a)) {
    message("getting inversed matrix")
    return(a)
  }
  data <- x$get()
  a <- solve(data, ...)
  x$setsolve(a)
  a
}

## This functions (both, makeCacheMatrix and cacheSolve) store the cache information about the inverse matrix that could change along time.

## makeCacheMatrix funtion build an especial matrix that contain the inverse matrix of a given matrix (x)

makeCacheMatrix <- function(x = matrix()) {
      inverse_m <- NULL
      set <- function(y) {
            x <<- y
            inverse_m <<- NULL
      }
      get <- function() x
      setinverse_m <- function (solve) inverse_m <<- solve
      getinverse_m <- function() inverse_m
      list(set = set, get = get, 
            setinverse_m = setinverse_m, 
            getinverse_m = getinverse_m)
}


## cacheSolve function take a special matrix an calculate the inverse matrix or add this value to a list to have 
## all the information about inverse matrix to a given initial matrices

cacheSolve <- function(x, ...) {
      inverse_m <- x$getinverse_m()
      if(!is.null(inverse_m)) {
            message("getting cached data")
            return(inverse_m)
      }
      data <- x$get()
      inverse_m <- solve(data, ...)
      x$setinverse_m(inverse_m)
      inverse_m  
      ## Return a matrix that is the inverse of 'x'
}

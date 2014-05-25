## Use example:
## a <- makeCacheMatrix(matrix(1:4,2,2))
## cacheSolve(a) # real computations
## cacheSolve(a) # extracting from cache

## Make a special cache object, vary much like a class.
## Same as original assignment
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)  
}


## Same function as original, just use solve instead mean

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m  
}

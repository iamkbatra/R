#cacheSolve function computes the inverse of the special “matrix” returned by makeCacheMatrix. 
#If the inverse has already been calculated (and the matrix has not changed), then 
#the cachesolve should retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv      
}
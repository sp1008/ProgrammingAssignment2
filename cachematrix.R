## Put comments here that give an overall description of what your
## functions do

## Basically, I copied the generic 'makeVector and cachemean' function shown on
## the assignment description page.
## It is a good starting place.
## 1)	instead of a numeric vector, we want a matrix as our input.
## 2)	set all m's into i's for 'inverse'
## 3)	setmean and getmean becomes setInv and getInv
## 4) 	return a list with setInv and getInv.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInv <- function(inv) i <<- inv
    getInv <- function() i
	list(set=set, get=get, 
		setInv=setInv, 
		getInv=getInv)
}


## Write a short comment describing this function
## Same as above, copy the example.
## Change the function so that it uses the makeCacheMatrix's parameter list.
## 1) Check if it has been solved before. If true, return
## 2) Use solve(x$get) to inverse the matrix, then set the inverse to cache.
## 3) return new inverse data.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInv()
    if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInv(inv)
	inv	
}

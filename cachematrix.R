## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

###########################################################
## Coursera - R Programming 
## Programming Assignment 2 

## Function Descriptions ## 
## 'makeCacheMatrix' - function creates a matrix and sets inverse calculation in cache 
## cacheSolve - function computes inverse of matrix 

### Example Usage ### 
## source("cachematrix.R")   #Source the file 
# mat1 <- makeCacheMatrix(matrix(1:4, 2))   #set a matrix    
# class(matrix1)    #check and confirm the class of mat1 as list 
# mat1$get()    #get the created matrix details 
# mat1$getInverse()   #checked the Iverse vaule is NULL 
# mat1$set(matrix(5:8,2))   #set a new matrix using set function 
# mat1$get()    #check if new matrix was set through set function 
# cacheSolve(mat1)    #get the inverse of matrix and set the cache 
# cacheSolve(mat1)    #check the inverse of matrix and inverse is being used from cache 
# mat1$getInverse()   #check the inverset has been set in cache 

## function makeCacheMatrix creates a special matrix object and can cache its inverse 
## and returns a list of functions 


makeCacheMatrix <- function(x = matrix()) { 
        # assigning inverseMatrix as NULL value 
        inverseMatrix <- NULL 
        # get function to get Matrix 
        get <- function() { 
                x 
        } 
        # set function to set a new Matrix 
        set <- function(newMatrix) { 
                x <<- newMatrix 
                inverseMatrix <<- NULL 
        } 
        # getInverse to get InverseMatrix 
        getInverse <- function() { 
                inverseMatrix 
        } 
        # setInverse with Inverse Matrix solution 
        setInverse <- function(solvedMatrix) { 
                inverseMatrix <<- solvedMatrix 
        } 
        #return a list of functions 
        list(get = get, set = set, getInverse = getInverse, setInverse = setInverse) 
} 




## function cacheSolve computes the inverse of the special "matrix" created by  
## function makeCacheMatrix above 


cacheSolve <- function(x, ...) { 
        # querying and asssigning inverseMatrix cached value 
        inverseMatrix <- x$getInverse() 
        
        # checking value of cache and using it if not NULL 
        if(!is.null(inverseMatrix)) { 
                message("getting cached Inverse Matrix data ....") 
                return(inverseMatrix) 
        } 
        
        # gettting matrix and calculating inverse 
        data <- x$get() 
        inverseMatrix <- solve(data, ...) 
        # set value on inverse matrix in cache 
        x$setInverse(inverseMatrix) 
        
        ## Return a matrix that is the inverse of 'x' 
        return(inverseMatrix) 
} 


        
# These two functions allow the user to create a random square matrix
# and to find its inverse efficiently. They can be used without 
# specifying any arguments.


# Function I: Creating a square matrix

# You can specify three parameters: 
# (1) S (seed), which controls the random number generation, 
# (2) D (dimension), ie how big the matrix is supposed to be 
# (3) I (inversion), which says whether you want to calculate 
#     the inversion or not

makeCacheMatrix <- function(S = 58462, D = 10, I = T) {
        # We save the choice whether we want the inversion
        choice <<- I
        
        # This is just to generate the matrix to be inverted:
        set.seed(S)
        Matrix <<- matrix(rnorm(D^2), nrow=D, ncol=D, byrow = TRUE) 
        
        # Here we perform the inversion (if required) and cache the reusult
        if(I == T){
                X <- solve(Matrix) 
                Inv <<- X
        }
        
}




# Function II: Finding the inverse matrix
cacheSolve <- function(x = Matrix, ...) {
        
        # If we have performed the inversion already, 
        # we just get the cached results
        if(choice == T){
                message("getting cached data") 
                return(Inv)
        }
        
        # In case we decided not calculate the inversion earlier 
        # we need to calculate it now:
        else {
                message("computing inverse matrix")
                results <- solve(x)
                return(results)
        }
        
}

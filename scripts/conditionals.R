

###############################

absValue <- function(n){
  if (n >= 0){
    return (n)
  }

  return (n * -1)
}

absValue(7)

absValue(-7)


###############################


getType <- function(n){

    if (is.integer(n)){
      return ("integer") # WORKS WITH 7L but not with 7
    }
    else if (is.numeric(n)) {
      if (round(n) == n) { # WORKS WITH 7 (although R treats as double)
        return( "integer")
      } else if (is.double(n)){
        return ("double")
      }
    }
    else if (is.character(n)){
      return ("string")
    }
    else if (is.logical(n)){
      return ("bool")
    }
    else {
      return ("OOPS")
    }
}

getType(7) #> "integer"

getType(7.5) #> "double"

getType("HELLO") #> "character"

getType(TRUE) #> "logical"

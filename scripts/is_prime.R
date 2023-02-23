isPrime <- function(n) {

  if(n <= 1) {
    return(FALSE)
  } else if (n == 2) {
    return(TRUE)
  }

  arr <- seq(2, n-1)
  cat(arr, "\n")

  test <- n %% arr
  cat(test, "\n")

  return(!(0 %in% test))
}

stopifnot(isPrime(4) == FALSE)
stopifnot(isPrime(5) == TRUE)
stopifnot(isPrime(11) == TRUE)

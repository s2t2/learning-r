
### Environment Variables


Use ".Renviron" file like a ".env" file:

```sh
ALPHAVANTAGE_API_KEY="abc123"
MY_MESSAGE="super secret"
```

```r
secret_message <- Sys.getenv("SECRET_MESSAGE")
secret_message
```

Alternative, using ".env" file approach:

```r
install.packages("dotenv")

library(dotenv)

secret_message <- Sys.getenv("SECRET_MESSAGE")
secret_message
```


## Development Tools

You could use R studio in the cloud, or download R Studio. 

### In the Cloud

Sign up for cloud r studio account: https://rstudio.cloud/


### Local Development

Install R:

```sh
brew install r
```

> NOTE: installation via homebrew may be problematic / may result in persistent package installation issues? So maybe just [install R Studio](https://support--rstudio-com.netlify.app/products/rstudio/download/) instead.


Access the console:

```sh
# use capital letter
R

# quit the console:
# quit()
```

Press `ctrl + L` to clear the console / start with a fresh screen



## Version Management

Explore this R version manager for installing project-specific environments and packages:

https://rstudio.github.io/renv/articles/renv.html


## Package Management


Installing:

```r
install.packages("packagename")
```

Importing:

```r
library("packagename")
```

Inspecting:

```r
library()
library("packagename")
```

Invoking:

```r
provided_func()

# or ...
packagename::provided_func()
```

### Project Management

In R Studio, before working with any .Rmd file, we need to run the .RProj file first, to help configure file paths, etc. Otherwise `here` filepaths might not work as expected.

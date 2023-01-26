
# calculates break-even number of years for hs vs college salary, factoring in cost of college

hs_annual <- 35000
college_annual <- 76000
college_fixed <- 70000 * 4

answer <- NULL

for (n_years in 1:15) {

  hs_net <- (hs_annual * (n_years + 4)) # accounts for 4 years of earnings while college student in school
  college_net <- (college_annual * n_years) - college_fixed

  if (college_net > hs_net){
    answer <- n_years
    break
  }

}

print("-------")
print(answer)

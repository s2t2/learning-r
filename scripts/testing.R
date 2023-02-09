

# https://www.rdocumentation.org/packages/testit/versions/0.13/topics/assert

# https://github.com/yihui/testit

install.packages('testit')

library("testit")

# this one passes without error
assert('Addition works', {
  2 + 2 == 4
})

# this one fails / leads to error
assert('Addition works?', {
  2 + 2 == 5
})
# assertion failed: Addition works
# Error: (2 + 2 == 5) is not TRUE

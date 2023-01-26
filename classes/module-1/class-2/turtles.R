#install.packages('TurtleGraphics')

library("grid")
library("TurtleGraphics")

# help(package="TurtleGraphics")

turtle_init()

# seems like the turtle teleports directly instead of moving smoothely

for (x in 1:5) {

  # do this 10 times:
  print("MOVING...")

  Sys.sleep(1)

  turtle_move(50, direction="forward")

  turtle_turn(45, direction="right")

  turtle_move(50, direction="backward")

}




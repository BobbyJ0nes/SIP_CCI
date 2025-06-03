# Week 9: Space Debris Collector

## Notes

Space game with physics - took the course force examples and made a collection game.

### The game:
- Blue ship that you control with the mouse
- Colorful debris floating around to collect
- Physics forces affecting the ship movement
- Had to adjust the forces so the ship doesn't get stuck at the bottom

### Physics tweaks:
- Gravity: 0.05 (was too strong before)
- Thrust: mouse-controlled, stronger upward than sideways
- Without the tweaks the ship just stuck to the bottom all the time

### How it works:
- Player and Debris classes both use PVector for position/velocity/acceleration
- Collision detection when ship touches debris
- Force gets applied with applyForce() method like in the examples
- Added some drag so ship doesn't fly off screen

### Controls:
- Mouse: thrust the ship around
- R: reset everything

### Based on course stuff:
- Ball.pde class structure for the objects
- force_ball example for applying forces
- PVector physics from all the movement examples 
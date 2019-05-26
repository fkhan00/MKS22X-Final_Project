# MKS22X-Final_Project
Daily Log

Friday May 17th, 2019:

We worked on creating an initial menu and a background for our game. We tried 
to find a built-in method of creating a menu but we couldn't find any. The menu
and background we have right now is more of a filler that we will improve on in stage 3.
The starting page for the menu is the starting screen for the actual game but we might
try to make our own later on. Tomorrow we will work on the Bullet and possibly the Player class.
We plan on finish testing for phase 1 by Sunday night.

Saturday May 18th, 2019:

Alex:
- Cleaned up methods and how setup/draw works. Will edit later to compensate for more code.
- Created global instance variables for Bullet storage.
- Added shooting mechanic for gun and Bullets.

Fakharyar:
- Created Bullets class and gave it basic display method
- Created abstract ships class with display as abstract method

Sunday May 19th, 2019:
- created first child class of Ship, Drone
- Drones go through screen from either right or left with random speeds
- Up to ten ships can be on screen at a time

Monday May 20th, 2019:

Fakharyar:
- adjusted flow rate of drones on screen
- ordered drones by 6 lanes without any intersections
- vertices of drones point towards direction they travel (now triangles)
- bullets now collide with drones and give score

Alex:
- fixed timing of enemy spawn
- added basic collision --> more bullets system (2x combo)
- spring cleaning on the code

Tuesday May 21st, 2019:

Alex:
- squashed some bugs
- more method cleanup
- optimization on ship/bullet speed and spawning rate
- added bullet explosions up to any number of a combo
- added replay feature after game over

Fakharyar:
- moved ship's location to the center of its displayed triangle
- created Game Over Screen
- added limit to number of combos possible

Phase 2 has been tested and is complete.

Wednesday May 22nd, 2019:

Fakharyar:
- created Fighter subclass of Ship (2 health shape of rectangle)
- created Speedster subclass of Ship(1 health very fast)

Alex:
- Fixed max combo system

Thursday May 23rd, 2019:

Alex:
- fixed spawn rates
- polished the max combo system to make values easier to follow

Fakharyar:
- created abstract Pickups class
- created child of Pickups, DoublePoints

Friday May 24th, 2019:

Fakharyar:
- made DoublePoints on screen and with multiplier effect
- created child of Pickups, Unlimited Bullets

Saturday May 25th, 2019:
Fakharyar:
- displayed Unlimited Bullets on screen and its effect
- adjusted duration for DoublePoints and Unlimited Bullets pickup


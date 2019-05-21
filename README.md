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

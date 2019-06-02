# MKS22X-Final_Project

# Project Description

This is a game where the player controls a large cannon and shoots at enemy ships flying in the air, where every kill creates a group of more projectiles to kill even more enemies. The player only has 10 bullets per round, so the game is based around how many ships the player can destroy before time runs out. Destroying certain ships causes them to release pickups that are temporary effects that help the player like having unlimited bullets or launching a wave of enemy ships. Some ships also release coins which you can use to purchase upgrades at the shop for things like your cannon's reload speed or a higher max combo. 


# Daily Log

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

ALex:
- background added
- made sprite for ship

Saturday May 25th, 2019:

Fakharyar:
- displayed Unlimited Bullets on screen and its effect
- adjusted duration for DoublePoints and Unlimited Bullets pickup

Alex:
- major fix on crashes and pickups
- rearranged, deleted, and fixed pickup system to allow more pickups to be implemented
- HUD changed: score & pickups on top left, bullets left on top right

Sunday May 26th, 2019:

Fakharyar:
- worked on sprites for Fighter and Speedster classes
- fixed a bug on Unlimited Bullets

Monday May 27th, 2019:

Fakharyar:
- gave sprites to Fighter and Speedster classes, might change later
- when you defeat speedster, bullet's combo jumps to 6
- created the Armada subclass of Ships 15 health, 1 speed, if killed, all onScreen bullets' combo jump to 6
- added Piercing bullet pickup. Alex's optimization made this much easier

Alex:
- added comments to make new additions of code much easier
- reorganized/optimized code (and fixed bugs that came with it)
- new pickup (yet to be implemented): more ships (spawn rate up)

Tuesday May 28th, 2019:

Fakharyar:
- implemented One More Bullet pickup

Alex:
- minor screen display fixes
- implemented More Ships pickup

Wednesday May 29th, 2019:

Fakharyar:
- added to HUD, now displays coins and score, indicates when highscore is broken
- replaced shooter with a cannon image

Alex:
- armada ship sprite created and implemented
- coin class created
- some expression reorganization

Thursday May 30th, 2019:

Fakharyar:
- implemented coin pickup
- created improved Main Screen
- created improved Game Over Screen with option to exit sketch

Alex:
- created/implemented coin sprite
- fixed menu issues and added effects
- added a "how to play" page

Friday May 31st, 2019:

Fakharyar:
- made sprites for One More Bullet and double points pickup
- changed class structure in pickups



Saturday June 1st, 2019:

Fakharyar:
- finished sprites for pickups
- fixed bug on Speedster's speed

Sunday June 2nd, 2019:

Alex:
- finished menu for the shop
- implemented upgrade system

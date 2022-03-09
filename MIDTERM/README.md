# OXYGEN CHAMBER 2.0

## Description: 

For this advanced Ecosystem Project, I decided to improve on my preexisting Oxygen Chamber Ecosystem. A system manipulated by oxygen levels. The program is a simplified simulation of an ecosystem where organisms are attracted to an oxygen tank in the middle. The organisms movement is affected through changes in oxygen levels manipulated by mouse movement.

#### To Implement: 

- Each organism has a health level which decreases the longer they stay outside the oxygen tank during critical times (yellow and red). 
- When the health levels are severely damaged the organisms have difficulties moving even when the tank is Green. 
- At a certain point these organisms may die and be terminated from the chamber (possibly show them as a counter on the side of the screen side by side to survivors).
- Organisms may replicate at certain health levels and at a certain age to show reproduction. (working with time and framecount).
- Organisms slow down near the wall but do not collide.
- The mouse acts as some sort of alien in the chamber, so the organisms are repulsed by it therefore they repel when coming around it. Contact with the mouse damages health levels. 
- Some of the organisms leave the tank even during the red or the yellow periods, I will adjust it so they no longer leave or can only leave to a certain degree where their health levels aren't affected.  


**These are initial changes I intend to implement so they are open to change. If I am unable to implement one of the points, I can possibly turn it into a different thing.**

#### What I Actually Implemented: 

- When the health levels are severely damaged the organisms have difficulties moving even when the tank is Green. 
- Organisms die when they're outside of the tank during the red. (I attempted to weaken them, but I can't understand my own code tbh).
- Organisms no longer move in the when the Tank is red. 
- Legend is implemented.
- Framecount is implemented as a survival timer of some sort. 

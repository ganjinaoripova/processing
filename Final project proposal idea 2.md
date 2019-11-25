**Intro to Interactive Media Final Project Proposal 2**
**Idea:**
To make an old timey spaceship game where you fly an airplane around and try to avoid obstacles, collect fuel. 


**List of things I need:**
- tilt sensor
- screen- maybe a TV?
- some space to move around

**Arduino Program:**
Senses input from tilt sensor, sends input to Processing to make the plane/spaceship move.


**Processing Program:**
Creates a 3D terrain (https://www.youtube.com/watch?v=ELpZW62HGVs) for the backdrop
Creates a sense of movement, like a starfield (https://www.youtube.com/watch?v=17WoOqgXsRM)
checks for collisions with obstacles, makes the ship fall if it detects any
checks for collisions with 'fuel', makes the plane/ship go a little faster
has a timer on the plane- sinks a little after a while
has a timer on the starfield- makes obstacles appear to move faster and faster after some time. 
game over graphics if collisions with obstacles occur. 


**Areas of concern**
- making the controller with the tilt sensor inside
- getting accurate readings from the tilt sensor to make the plane/ship move properly
- checking for collisions, generating obstacles. 
- changing the terrain and making the starfield work on a timer


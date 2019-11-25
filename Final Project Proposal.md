## Intro to Interactive Media Final Project Proposal

#### Idea: 
To make a game of battleships. The setup will include a screen for each player and a manual set up on which they can place battleships.
The screen is for the player’s own arrangement of ships while the manual set up is for them to place ships on their opponents’ arrangement. 
Essentially, it’ll be the same program running on both screens, each connected to Arduino connected to the manual set up. Each player has their opponent’s manual setup on which they place tokens representing ships- the placement of ships is sensed by photoresistors on the setup which ‘talks’ to Arduino, checking if the placement on the board matches the one on the screen. If yes, it’s a ‘hit’, and I’ll have some explosion graphics on the screen (maybe an image). If not, it’s a miss. The game goes on till one person’s ships are sunk, which the program keeps checking for. When this happens, the screen displays game over. 
I’m not sure if I can get both the arduinos to talk to each other so that game over or hit or miss are displayed on both screens, if I can, that would be ideal.

#### List of things I need:
- Lots of Photoresistors
- Well-lit space
- A tabletop of some kind where two people can sit
- An extra Arduino and laptop 
- tokens for battleships (might make them so they can cover photoresistors perfectly)

#### Arduino Program:
Senses which photo resistors are covered, sends input to Processing.

#### Processing Program:
Creates a grid for battleships to be placed. You can arrange your ships using the mouse pressed function. Each square changes colour (or some other basic graphic) to depict a ship being placed. If the photoresistor on the grid is covered and the corresponding square on the screen is a different colour, the screen will say hit. If not, miss. 

#### Areas of greatest concern:
-	Matching the photoresistors on the manual set up to the grid on the processing screen. I think I’ll have to link them to each other individually.
-	Getting Processing to talk to two arduinos. (maybe use a different type of arduino?)
- Figuring out how to have two screens connected to the same arduino- don't know if this is possible.


**- to clarify-**
either have one screen and one arduino for each player- same program runs on both, but they can't interact with each other.
- or have one arduino (with enough pins to connect to photosensors from both players.) The problem here is, I don't think you can connect two screens to one arduino? Also each screen only shows the player's own ships. so I guess it doesn't make sense to connect them both to the same arduino?





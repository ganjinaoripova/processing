## FINAL PROJECT: BATTLESHIPS
My idea was to create a game of battleships, with the same basic rules as the traditional games but a slightly different way of playing, a combination of virtual and manual. 
Since it is a two player game, I would have to have two screens so that the players couldn’t see the arrangement of their opponent’s ships. I wanted the guessing of the placement of ships to be manual, instead of saying a grid number like in the original game; I thought it might be more fun that way.  I decided to use a webcam and colour tracking. 
The setup consists of two monitors facing away from each other and a transparent sheet suspended over a webcam. 
The rules of the game are as follows:
Each player chooses the arrangement of their own ships on their respective screens. (Obviously neither of them knows the arrangement of the other’s ships)
The players take turns placing a red token on a transparent screen; the position of the token is tracked and matched to the opponent’s grid. If the position of the token matches that of a ship, it’s a hit. A green LED blinks. If not, it’s a miss, and a yellow LED blinks.

![](path/to/image.png)


## List of parts (not in the kit):
1.	Extra monitor
2.	Transparent sheet
3.	Mouse
4.	Red token
5.	Webcam

## Problems I ran into:
1.	The first problem was getting two windows to begin with, and accessing them independently.
2.	I would need three windows- one for each player’s boards and one for the webcam. This used up too much memory, so I decided to stick to one board and one window for the webcam. So one player arranges their ships and the other guess where they are.
3.	Linking the tracked red colour to the grid- I used Daniel Schiffman’s colour tracking tutorial and adapted it to my project so it could ‘talk’ to the other window

## Feedback 
The game was pretty straightforward, so the rules were not difficult to understand, but I did have to explain them first. People seemed to like the idea of the tokens, but it was sort of difficult to place them on the transparent grid in a certain position- so I decided to make the webcam window visible, just so people could see what they were doing, and what the webcam was tracking. 



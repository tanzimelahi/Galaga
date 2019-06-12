

Instructions:
The project is a modeled after the arcade game galaga.
The player tries to survive as long as possible by killing monsters
If he gets hit, he dies and the game is over.
If all monsters are killed, the player moves on to the next level
Use arrow keys to move the player left and right
Press enter to shoot bullets.
It is recommended that you don't hold down on enter to enjoy the maximum fun of the game.

Project Description:
The project uses algorithms based on trigonometry and coordinate geometry and a little bit of calculus to move and display the sprites or objects. During the very beginning of the game the various monsters are gathered and made to move around in a circular pattern. This is done by using the general form of the equation of a circle and updating the monster's y coordinate with values of the circle equation. The x coordinates are incremented by a fixed value. All the monsters have a common center and common radius of the circle which is the reason it appears that one monster is following the other one during the very first motion made by the monsters.
The monsters then move in a path that is based on the sine graph. By making an equation of sine and giving it a constant amplitude and by storing the initial y coordinates of the monsters it was possible to create a sine path for the monsters to follow. After an interval that is determined by a timer function, approximately 4 to 5 monsters form a circle. After spinning around in the circle for a little while, the monsters then move on a straight line whose slope is determined by  taking the derivative of the circle implicitly at that point. If any of the monsters touch any of the borders they usually bounce back from there if they are moving in the  sinusoidal pattern while they transform to the top of the screen if they touch the lower part of the screen if they are making other patterns like the circular or the tangential motion. After touching the border, the monsters simply fall down in a straight line. This relatively easy motion is used because by the time this happens, the player must have had to go through a lot and this is done as a favor so that he can actually win the level.



log starts here

17th May:
started creating the basics of player class
getter and setter methods added
working on display

18th of May
display class made
thinking of creating only one monster class instead of three
linear movement of hero added

19th of May
made the abstract class bullet and hero bullet with getter around
setter methods
working on istouching

20th May
made the istouching for herobullet
started experimenting on monster movements with sinusoidal patterns

23rd May
made random monsters appear in the main file
creating a timer logic so can alternate between modes
new experimentation of new monster movements

24th May
some bugs encountered while working on circular motion
working to fix them

26th May
circular motion completed
bullet class of monster added
istouching of monster bullet class also completed

29th May
working on tangential motion related to the curves
stuck on getting the y cordinate when the circle stops moving

30th May
aborted tangential motion with fix coordinates
made the motion have a y value within the radius of the circle
so it gives the allusion of tangent to the circle
at the point of stopping

31th May
working on logic on the main method to combine the motions
as of now getting unexpected behaviour when switching from siusoidal to
tangential motions

1st june
made lists for different motions
the logic is when switching between motions delte them from the list,
add them to the new list and store the ycord at the time of switched

2nd june
aborted changing from sinusoidal to tangent motion, instead switching to circular motion and then tangent motions

3rd June
experimented with timer and learnt how it works
made it so that can get switches between motions quickly

4th June
made modes with the help of timer
fixed the bugs caused by motion switching
project finished

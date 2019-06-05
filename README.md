Note: Due to exceptional circumstances, it was impossible for me to
commit regularly. The commits made around 5th june are artificial and
demonstrate how the project was build.The commits were made with the
help of my planning notebook. I planned out on a notebook before I
start coding, so with the help of that i can remember which part i did
on which day and that's what the commits roughly reflect

Description of project
The project is a modeled after the arcade game galaga.
The player tries to survive as long as possible by killing monsters
If he gets hit, he dies and the game is over.
If all monsters are killed, the player wins
Use arrow keys to move the player left and right
Press enter to shoot bullets.

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

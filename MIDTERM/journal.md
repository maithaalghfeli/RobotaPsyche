## General Thoughts:

Building on top of my own code was not the easiest, I was scared to change things because I worked on them really hard before. I did not want to lose my progress even though I had the original version saved. I was still scared to manipulate it. 

I refrained from using any outside sources besides the processing.org key page. I wanted to take it as a challenge to myself to understand the code instead of finding an easy way out and looking for easier solutions online. I do understand how open source works but I preferred to do things my way even though they may have been longer and more tedious. 

I thoroughly enjoy commenting my code, it is probably one of my favourite things to do in coding. 

## Main Difficulties and Solutions:

**D:** Timer is not refreshing when it ends. 

**S:** Create timePassed() function in Tank class, and not put the restart of the timer inside the for loop that iterates the timer. Also, create timer increment as a global variable initialised before setup().


**D:** After I was able to set up the timer correctly, I struggled with how fast things went back to normal, we didn't see change because the counter initialised instantly.

**S:** Created a time gap between reinitialising the timer and it ending to show the colour and strength change in the organisms more effectively. 


**D:** Legend text is not showing correctly when I use a for loop to create the colour boxes. 

**S:** No for loop, use text to determine box location. Turned out easier than I expected, even though it took me around 2 hours to figure out. 


**D:** Organisms won't die. I tried implementing the ArrayList but it wasn't doing it for me. pop() splice() remove() all did not work whatsoever, they would remove random organisms but never the ones I was targetting outside the tank.  

**S:** If the organism doesn't make it back into the tank in time, their movement is halted and they turn to black. I used an illusion to cover up the fact that I did not know how to remove the specific organisms from the array. 


**D:** Even after I made velocity = 0, and stopped organism-tank attraction; organisms still moved during the red.

**S:** Thanks to Sarah, I realised that the force attraction between the organisms themselves was still acting up which in turn caused my organisms to move. Once I turned that off with an if statement, it worked fantastically. 


**D:** Checking if the object is inside the tank during critical periods.

**S:** Figured out how the distance function works, I kept misusing it for 3 days before I realised what I was doing. 


**D:** A difficulty I failed to implement was weakening the strong organisms during the red instead of killing them instantly. I tried implementing it many times, but the organisms either kept dying or had no change at all even though the code itself worked, I wasn't seeing my intended results. 


**D:** I wanted my organisms to replicate and had I used an ArrayList, I would've been easily able to implement it. I was already using the mouse a lot so I didn't want to overwhelm the interface and the user with a lot of mouse movements. 


**D:** My legend isn't detailed with steps because I did not like it aesthetically, so I do hope the ecosystem itself is intuitive enough for the user. 


# THANK YOU! <3

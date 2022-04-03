# mastermind
My solution to the Mastermind project in the Ruby path of The Odin Project.

## Implementation

I decided to go with the Swaszek strategy, as I could picture how to create an array with all possible guesses and then reduce that array based on keypegs from previous guesses.

https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind

## What did I learn

I learned about the permutation method of the Array class -- it took a few tries to use that to create the array of 1,296 possible code combinations. I think there is still some room for improvement here, however, as this version first creates a much larger array with lots of duplicates that then needs to be pared back to the 1,296 unique combinations. My original naive idea of setting up 4 nested loops and creating the arrays that way is actually a lot faster. However, since it only has to be done once at the beginning of the game I don't think it should be a problem.
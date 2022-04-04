# mastermind
My solution to the Mastermind project in the Ruby path of The Odin Project. It is possible for the human player to be either codemaker or codebreaker.

## Implementation notes

In case the computer is the codebreaker, I decided to go with the Swaszek strategy. I was able to understand this strategy the best, as I could picture how to create an array with all possible guesses and then reduce that array based on keypegs from previous guesses.

Inspiration found on:
https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind

## What I learned

I learned about the permutation method of the Array class -- it took a few tries to use that to create the array of 1,296 possible code combinations. I think there is still some room for improvement here, however, as this version first creates a much larger array with lots of duplicates that then needs to be pared back to the 1,296 unique combinations. My original naive idea of setting up 4 nested loops and creating the arrays that way is actually a lot faster. However, since it only has to be done once at the beginning of the game I don't think it should be a problem.

It was another good chance to practice OOP principles, although I'm sure there is room for a lot of improvement! This time I had the chance to practice inheritance, as the ComputerPlayer and HumanPlayer classes had different implementations of the same method.

## Areas for improvement

The game could certainly be improved by offering the chance to continue playing rounds as long as the user wants to. At the moment, each round has to be started from the very beginning.

Also, with the Swaszek strategy, the computer always starts with r r g g as the initial guess. After playing against the computer a few times, the savvy player will figure out this loophole and definitely avoid using that as the master code. So I could choose to have the computer start with a completely random guess, even if that means it would take more guesses to crack the code.

Finally, there are a few methods that are still too long accoring to RuboCop that I could probably try to split up into smaller methods that only do one thing and do it well.
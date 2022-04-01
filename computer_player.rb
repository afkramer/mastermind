# computer_player.rb

require 'game_constants'

class ComputerPlayer
  include GameConstants

  def choose_code
    4.times { @master_code.push(GameConstants::COLORS.sample) }
    @master_code
  end

  def rate_guess(guess_array)
    # Refactor to make copy of master code
    # Then check for exact pegs in first loop
    # Then check for close pegs in the second loop


    master_copy = @master_code
    keypeg_array = guess_array.each_with_index do |peg, index|
      if @master_code[index] == peg
        keypeg_array.push('r')
        # Change the element at that index of the master code
        # Otherwise correct guesses will be counted several times
        master_copy[index] = 'x'
      end
    end
  end

  def rate_exact_pegs(guess_array)
    # Loop through once to find all pegs that are exact
  end

  def rate_correct_colors(guess_array)
    # Loop through a second time to see how many are just close
  end

end

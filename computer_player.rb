# computer_player.rb

require './game_constants'
require './player'

class ComputerPlayer < Player
  include GameConstants

  def choose_code
    4.times { @master_code.push(GameConstants::COLORS.sample) }
    @master_code
  end

  def show_code
    p @master_code
  end

  def rate_guess(guess_array)
    master_copy = @master_code
    keypeg_array = []

    guess_array.each_with_index do |peg, index|
      if master_copy[index] == peg
        keypeg_array.push('r')
        guess_array[index] = 'x'
        master_copy[index] = 'x'
      end
    end

    guess_array.each_with_index do |peg, index|
      master_index = peg == 'x' ? nil : master_copy.find_index(peg)
      if master_index
        keypeg_array.push('w')
        master_copy[master_index] = 'x'
      end
    end
    keypeg_array
  end

  def rate_exact_pegs!(guess_array, master_copy)
    # Loop through once to find all pegs that are exact
  end

  def rate_correct_colors!(guess_array, master_copy)
    # Loop through a second time to see how many are just close
  end
end

player = ComputerPlayer.new
player.choose_code
player.show_code
puts "Guess 1: #{player.rate_guess(%w[r g b y])}"
puts "Guess 2: #{player.rate_guess(%w[g b y y])}"
puts "Guess 3: #{player.rate_guess(%w[b b r r])}"

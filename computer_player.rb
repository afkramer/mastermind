# computer_player.rb

require './game_constants'
require './player'

# Contains the computer-specific methods for playing the game
class ComputerPlayer < Player
  include GameConstants

  def set_name
    @name = gui.get_computer_name
  end

  def choose_code
    4.times { @master_code.push(GameConstants::COLORS.sample) }
    @master_code
  end

  def rate_guess(guess_array)
    master_copy = @master_code.clone
    keypeg_array = []

    guess_array.each_with_index do |peg, index|
      if master_copy[index] == peg
        keypeg_array.push('kr')
        guess_array[index] = 'x'
        master_copy[index] = 'x'
      end
    end

    guess_array.each_with_index do |peg, index|
      master_index = peg == 'x' ? nil : master_copy.find_index(peg)
      if master_index
        keypeg_array.push('kw')
        master_copy[master_index] = 'x'
      end
    end
    keypeg_array
  end
end

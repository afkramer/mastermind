# player.rb

require './gui'

# Player is the superclass for human_player and computer_player
class Player
  attr_reader :name, :master_code
  attr_writer :opponent_name

  def initialize
    @name = nil
    @opponent_name = nil
    @gui = Gui.new
    @master_code = []
  end

  def rate_guess(guess_array, master_array = @master_code)
    master_copy = master_array.clone
    guess_copy = guess_array.clone
    keypeg_array = []

    guess_copy.each_with_index do |peg, index|
      if master_copy[index] == peg
        keypeg_array.push('kr')
        guess_copy[index] = 'x'
        master_copy[index] = 'x'
      end
    end

    guess_copy.each do |peg|
      master_index = peg == 'x' ? nil : master_copy.find_index(peg)
      if master_index
        keypeg_array.push('kw')
        master_copy[master_index] = 'x'
      end
    end
    keypeg_array
  end
end

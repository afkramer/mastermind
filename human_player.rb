# human_player.rb

require 'gui'
require 'game_constants'

# HumanPlayer contains functionality for a human player
class HumanPlayer < Player
  def get_guess
    code = nil
    while code.nil?
      input = gui.get_code
      input = input.split(' ')
      if input.all? { |peg| GameConstants::COLORS.include?(peg) }
        code = input
      else
        gui.input_not_allowed
      end
    end
    code
  end
end

# human_player.rb

require 'gui'

# HumanPlayer contains functionality for a human player
class HumanPlayer < Player
  def initialize
    super
    @gui = Gui.new
  end

  def choose_code
    code = nil
    while code.nil?
      input = gui.get_code
      input = input.split('' '')
      if input.all? { |peg| %w[r b g y].include?(peg) }
        code = input
      else
        gui.input_not_allowed
      end
    end
    code
  end
end

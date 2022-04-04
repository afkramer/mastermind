# human_player.rb

require './gui'
require './game_constants'

# HumanPlayer contains functionality for a human player
class HumanPlayer < Player
  def set_name
    @name = @gui.get_human_name
  end

  def choose_code
    input = get_code('master_code')
    if code_ok?(input)
      input
    else
      @gui.input_not_allowed
      choose_code
    end
  end

  def get_guess(*)
    input = get_code('guess')
    if code_ok?(input)
      input
    else
      @gui.input_not_allowed
      choose_code
    end
  end

  def get_code(code_type)
    if code_type == 'guess'
      @gui.get_guess(@name).downcase.split(' ')
    else
      @gui.get_code(@name, @opponent_name).downcase.split(' ')
    end
  end

  def code_ok?(code)
    code.all? { |peg| GameConstants::COLORS.include?(peg) }
  end

end

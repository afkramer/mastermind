# computer_player.rb

require 'game_constants'

class ComputerPlayer
  include GameConstants

  def choose_code
    code = []
    4.times { code.push(GameConstants::COLORS.sample) }
    code
  end
end

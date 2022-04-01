# player.rb

# Player is the superclass for human_player and computer_player
class Player
  def initialize
    @name = nil
    @role = nil
    @gui = Gui.new
  end
end

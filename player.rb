# player.rb

require './gui'

# Player is the superclass for human_player and computer_player
class Player
  attr_reader :name

  def initialize
    @name = nil
    @gui = Gui.new
    @master_code = []
  end
end

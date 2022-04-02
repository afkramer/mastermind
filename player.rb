# player.rb

require './gui'

# Player is the superclass for human_player and computer_player
class Player
  attr_reader :name, :role

  def initialize
    @name = nil
    @role = nil
    @gui = Gui.new
    @master_code = []
  end
end

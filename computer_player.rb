# computer_player.rb

require './game_constants'
require './player'

# Contains the computer-specific methods for playing the game
class ComputerPlayer < Player
  attr_reader :possible_guesses

  include GameConstants

  def initialize
    super
    @possible_guesses = []
  end

  def set_name
    @name = @gui.get_computer_name
  end

  def choose_code
    4.times { @master_code.push(GameConstants::COLORS.sample) }
    @master_code
  end

  def initialize_possible_guesses
    colors_to_permutate = []
    GameConstants::COLORS.cycle(4) { |color| colors_to_permutate.push(color) }
    colors_to_permutate.sort.permutation(4) { |perm| @possible_guesses.push(perm) }
    @possible_guesses.uniq!
  end

  def get_guess(guess_num, prev_guess, keypegs)
    sleep 0.5
    @gui.computer_thinking(@name)
    sleep 4
    if guess_num == 1
      %w[r r g g]
    else
      @possible_guesses = @possible_guesses.select do |guess_array|
        new_keypegs = rate_guess(guess_array, prev_guess)
        keypegs == new_keypegs
      end
      @possible_guesses[0]
    end
  end
end

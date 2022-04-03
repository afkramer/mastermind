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

  def rate_guess(master_array, guess_array)
    master_copy = @master_code.clone
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

  def initialize_possible_guesses
    GameConstants::COLORS.each do |pos_one|
      GameConstants::COLORS.each do |pos_two|
        GameConstants::COLORS.each do |pos_three|
          GameConstants::COLORS.each do |pos_four|
            @possible_guesses.push([pos_one, pos_two, pos_three, pos_four])
          end
        end
      end
    end
  end

  def initialize_possible_guesses_better
    # GameConstants::COLORS.permutation(4) { |perm| @possible_guesses.push(perm) }
    colors_to_permutate = []
    GameConstants::COLORS.cycle(4) { |color| colors_to_permutate.push(color) }
    p colors_to_permutate.sort
    colors_to_permutate.sort.permutation(4) { |perm| @possible_guesses.push(perm) }
    @possible_guesses.uniq!
  end

  # Using Swazsek's method
  def guess(guess_num, *keypegs)
    if guess_num == 1
      %w[r r g g]
    else
      possible_guesses = possible_guesses.select do |guess_array|
        rate_guess(guess_array, prev_guess) == keypegs
      end
    end
  end
end

computer_player = ComputerPlayer.new
# computer_player.initialize_possible_guesses
computer_player.initialize_possible_guesses_better
puts computer_player.possible_guesses.length
p computer_player.possible_guesses[0]
p computer_player.possible_guesses[1]
p computer_player.possible_guesses[-2]
p computer_player.possible_guesses[-1]

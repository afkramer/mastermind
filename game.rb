# game.rb

require './gui'
require './computer_player'
require './human_player'
require './board'

# Game contains code to create players, set up the board, and run the game
class Game
  attr_reader :codebreaker, :codemaker, :board   # DELETE AFTER DEBUGGING

  def initialize
    @codebreaker = HumanPlayer.new
    @codemaker = ComputerPlayer.new
    @board = Board.new
    @gui = Gui.new
  end

  def play
    start_game
    set_up_board
    guess_results = process_guesses
    end_game(guess_results)
  end

  def start_game
    @gui.display_introduction
    set_up_players
    @codebreaker.set_name
    @codemaker.set_name
    @codebreaker.opponent_name = @codemaker.name
    @codemaker.opponent_name = @codebreaker.name
  end

  def set_up_players
    case @gui.wish_to_be_codebreaker
    when 'y'
      # No action needed. Game is initialized for this case
    when 'n'
      @codebreaker, @codemaker = @codemaker, @codebreaker
      @codebreaker.initialize_possible_guesses
    else
      @gui.input_not_allowed
      set_up_players
    end
  end

  def set_up_board
    @board.add_master_code(@codemaker.choose_code)
  end

  def process_guesses
    guess_count = 0
    prev_guess = []
    prev_keypegs = []
    13.times do
      guess_count += 1
      break if guess_count == 13

      guess = @codebreaker.get_guess(guess_count, prev_guess, prev_keypegs)
      @board.add_guess(guess)
      keys = @codemaker.rate_guess(guess)
      @board.add_keys(keys)
      @gui.display_board(@board.codepegs, @board.keypegs)
      break if keys.all? { |peg| peg == 'kr' } && keys.length == 4
    end
    guess_count
  end

  def end_game(guess_results)
    if guess_results < 13
      @gui.display_game_won(@codebreaker.name, guess_results)
    else
      @gui.display_game_lost(@codebreaker.name, @codemaker.name)
    end
    @gui.display_board(@board.codepegs, @board.keypegs, @board.master_code)
  end
end

game = Game.new
game.start_game
puts game.codebreaker.name
puts game.codemaker.name
game.set_up_board
p game.codemaker.master_code
p game.board.master_code

# game.rb

require './gui'
require './computer_player'
require './human_player'
require './board'

# Game contains code to create players, set up the board, and run the game
class Game
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
    @codebreaker.set_name
    @codemaker.set_name
  end

  def set_up_board
    @board.add_master_code(@codemaker.choose_code)
  end

  # Returns guess count if game won, returns nil if no more guesses left
  def process_guesses
    (1..10).each do |guess_count|
      guess = @codebreaker.get_guess
      @board.add_guess(guess)
      keys = @codemaker.rate_guess(guess)
      @board.add_keys(keys)
      @gui.display_board(@board.codepegs, @board.keypegs)
      return guess_count if keys.all? { |peg| peg == 'kr' }
    end
  end

  def end_game(guesses_results)
    if guesses_results.nil?
      @gui.display_game_lost(@codebreaker.name)
    else
      @gui.display_game_won(@codebreaker.name, guesses_results)
    end
    @gui.display_board(@board.codepegs, @board.keypegs, @codemaker.master_code)
  end
end

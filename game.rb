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

  def process_guesses
    guess_count = 0
    13.times do
      guess_count += 1
      break if guess_count == 13

      guess = @codebreaker.get_guess
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

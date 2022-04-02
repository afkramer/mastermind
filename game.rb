# game.rb

class Game

  def initialize
    @codebreaker # Either a human_player or computer_player object
    @codemaker # Same as above
    @board  # Keeps track of the guesses and feedback about the moves
    @gui
  end

  # TODO (in second version, when computer can also break the code)
  # Decide how many rounds to play (TODO when computer AI has been established)
  # Get players (TODO when computer to be included)

  def play
    start_game
    get_code
    process_guesses
  end

  def start_game
    # Display instructions for how to play the game
      # Colorized 'O' characters will be used to represent code pegs
      # red and white 'o' characters will be used to represent key pegs
      # Colorizer gem
    # Get human player's name
    # Set up codebreaker as human_player
    # Set up codemaker as computer_player
    # Set up the board (maybe as a hash with the guess number as the key and then a further hash as the value with array for the codepegs and array for keypegs)
    # Have the computer choose the code to be guessed
    
  end

  def process_guesses
    (1..10).each do |guess_count|
      guess = @codebreaker.get_guess
      @board.add_guess(guess)
      keys = @codemaker.rate_guess(guess)
      board.add_keys(keys)
      gui.display_board(@board)
      if keys.all? { |peg| peg == 'r' }
        return "won"
        break
      end
    end
  end

  def end_game(guesses_results)
    if guesses_results = 'won'
      gui.display_game_won(@codebreaker.name, guess_count)
    else
      gui.display_game_lost(@codebreaker.name, guess_count)
    end
  end
end

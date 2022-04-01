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
    # Display the empty board? Or do I want to keep adding rows instead of showing the whole board at once?
    # Start guessing (1..5).for_each?
      # Incrememt the guesses -> player only gets 10 guesses
      # if guess_count = 11
        # end game
        # break
      # codebreaker enters a guess
      board.add_guess(@codebreaker.get_guess(@codebreaker.name))
      # store the guess in the board
      # codemaker provides feedback with keypegs
      # display codepegs and keypegs
      # if the code has been guessed, display winning text
    # end guessing loop
  end
end

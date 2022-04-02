# gui.rb

# Gui contains functionality to make the game work in the command line
class Gui
  def display_introduction
    puts 'Welcome to Mastermind!'
    puts 'To start, the codemaker sets a code consisting of 4 colored pegs.'
    puts 'Each peg may be one of 6 colors and duplicate colors are allowed.'
    puts 'In this version, blank spots are not allowed.'
    puts
    puts 'The codebreaker must then try to crack the code using 10 guesses or less.'
    puts "Don't worry: the codemake must give you feedback on how well you guessed."
    puts 'The codemaker will set key pegs to indicate the following:'
    puts 'Red peg -> Exact match. Both color and position are correct.'
    puts 'White peg -> Color is correct. Only the color of the peg is correct.'
    puts
    puts "Let's get started!"
  end

  def get_guess(player_name)
    puts "#{player_name}, please enter your guess."
    puts 'Please enter any combination of r, g, b, y, p or w separated by spaces.'
    gets.chomp
  end

  def input_not_allowed
    puts "That input isn't allowed. Please try again."
  end

  def display_board(codepegs, keypegs, *master_code)
    codepegs.each_with_index do |row, index|
      puts "#{row.join('  ')}  ||  #{keypegs[index].nil? ? nil : keypegs[index].join(' ')}"
    end
    puts
    if master_code == []
      puts ' ?    ?    ?    ?'
    else
      puts master_code.join('  ')
    end
    puts
  end

  def display_game_won(name, guess)
    puts "Congratulations, #{name}! You won on guess #{guess}"
    puts 'Here is the final board:'
    puts
  end

  def display_game_lost(name)
    puts "Sorry, you didn't crack the code in time #{name}. Better luck next time!"
    puts 'Here is the final board and the master code:'
    puts
  end
end

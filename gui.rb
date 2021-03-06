# gui.rb

# Gui contains functionality to make the game work in the command line
class Gui
  def display_introduction
    puts
    puts 'Welcome to Mastermind!'
    puts
    puts 'To start, the codemaker sets a code consisting of 4 colored pegs.'
    puts 'Each peg may be one of 6 colors and duplicate colors are allowed.'
    puts 'The colors are red, blue, green, yellow, purple and white.'
    puts 'In this version, blank spots are not allowed.'
    puts
    puts 'The codebreaker must then try to crack the code using 12 guesses or less.'
    puts 'Each guess should be any combination of r, g, b, y, p or w separated by spaces.'
    puts
    puts "Don't worry: the codebreaker receives feedback on each guess,"
    puts 'which can then be used to come up with the next guess.'
    puts
    puts 'Feedback is given in the form of key pegs, which indicate the following:'
    puts 'Red peg -> Exact match. Both color and position are correct.'
    puts 'White peg -> Color match. Only the color of the peg is correct.'
    puts
    puts 'The computer always takes care of evaluating guesses by setting the keypegs,'
    puts "but don't worry it can't cheat! :) "
    puts
    puts "Let's get started!"
    puts
  end

  def wish_to_be_codebreaker
    puts
    print 'Do you wish to be the codebreaker (y/n): '
    gets.chomp
  end

  def get_human_name
    puts
    print 'Please enter your name: '
    gets.chomp
  end

  def get_computer_name
    puts
    print 'Please give your computer opponent a name: '
    gets.chomp
  end

  def get_guess(player_name)
    puts
    print "#{player_name}, please enter your guess: "
    gets.chomp
  end

  def computer_thinking(name)
    puts
    puts "#{name} is thinking..."
  end

  def get_code(player_name, opponent_name)
    puts
    puts "#{player_name}, please choose a code for #{opponent_name} to crack."
    print 'Use any combination of r, g, b, y, p or w separated by spaces: '
    gets.chomp
  end

  def input_not_allowed
    puts
    puts "That input isn't allowed. Please try again."
  end

  def display_board(codepegs, keypegs, *master_code)
    puts
    codepegs.each_with_index do |row, index|
      print "#{row.join('  ')}  | "
      printf '%2d', (index + 1)
      puts " |  #{keypegs[index].nil? ? nil : keypegs[index].join(' ')}"
      puts
    end
    if master_code == []
      puts ' ?    ?    ?    ?'
    else
      puts master_code.join('  ')
    end
    puts
  end

  def display_game_won(name, guess)
    puts
    puts "Congratulations, #{name}! You won on guess #{guess}."
    puts
  end

  def display_game_lost(name, computer_name)
    puts
    puts "Sorry, you didn't crack the code in time, #{name}."
    puts "Looks like #{computer_name}'s code was too difficult! Better luck next time!"
    puts
  end
end

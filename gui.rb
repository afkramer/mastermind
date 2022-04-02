# gui.rb

# Gui contains functionality to make the game work in the command line
class Gui
  def display_introduction
    puts 'Welcome to Mastermind!'
  end

  def get_guess(player_name)
    puts "#{player_name}, please enter your guess."
    puts 'Please enter any combination of r, g, b, y, separated by spaces.'
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
  end

  def display_game_lost(name)
    puts "Sorry, you didn't crack the code in time #{name}. Better luck next time!"
  end
end

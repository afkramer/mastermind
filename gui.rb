# gui.rb

# Gui contains functionality to make the game work in the command line
class Gui
  def show_introduction
    puts 'Welcome to Mastermind!'
  end

  def get_code(player_name)
    puts "#{player_name} please enter the code to be broken."
    puts 'Please enter any combination of r, g, b, y, separated by spaces.'
    gets.chomp
  end

  def input_not_allowed
    puts "That input isn't allowed. Please try again."
  end
end

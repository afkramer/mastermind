# board.rb

# Stack overflow question:
# https://stackoverflow.com/questions/1489183/how-can-i-use-ruby-to-colorize-the-text-output-to-a-terminal

# Info about getting gems to work with replit:
# https://replit.com/talk/announcements/Ruby-Packages-via-RubyGems/11349

require 'colorize'

# Board holds guess and key arrays to be displayed in GUI
# Colorize is used to add color to the pegs
class Board
  attr_reader :codepegs, :keypegs

  def initialize
    @master_code = []
    @codepegs = []
    @keypegs = []
  end

  def add_master_code(code)
    @master_code = convert_array_to_color(code)
  end
  
  def add_guess(guess_array)
    @codepegs.push(convert_array_to_color(guess_array))
  end

  def add_keys(key_array)
    @keypegs.push(convert_array_to_color(key_array))
  end

  def convert_array_to_color(array)
    array.map! do |peg|
      add_peg_color(peg)
    end
  end

  def add_peg_color(peg)
    case peg
    when 'r'
      '(@)'.colorize(:red)
    when 'b'
      '(@)'.colorize(:light_cyan)
    when 'g'
      '(@)'.colorize(:green)
    when 'y'
      '(@)'.colorize(:yellow)
    when 'p'
      '(@)'.colorize(:light_magenta)
    when 'w'
      '(@)'.colorize(:white)
    when 'kr'
      'o'.colorize(:light_red)
    when 'kw'
      'o'.colorize(:light_white)
    end
  end
end

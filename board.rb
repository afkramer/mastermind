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
    @codepegs = []
    @keypegs = []
  end

  def add_guess(guess_array)
    guess_array.map! do |peg|
      add_code_color(peg)
    end

    @codepegs.push(guess_array)
  end

  def add_keys(key_array)
    key_array.map! do |peg|
      add_key_color(peg)
    end

    @keypegs.push(key_array)
  end

  def add_code_color(peg)
    case peg
    when 'r'
      'O'.colorize(:red)
    when 'b'
      'O'.colorize(:light_cyan)
    when 'g'
      'O'.colorize(:green)
    when 'y'
      'O'.colorize(:yellow)
    end
  end

  def add_key_color(peg)
    case peg
    when 'r'
      'o'.colorize(:light_red)
    when 'w'
      'o'.colorize(:light_white)
    end
  end
end

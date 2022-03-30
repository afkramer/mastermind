# board.rb

# Stack overflow question:
# https://stackoverflow.com/questions/1489183/how-can-i-use-ruby-to-colorize-the-text-output-to-a-terminal

# Info about getting gems to work with replit:
# https://replit.com/talk/announcements/Ruby-Packages-via-RubyGems/11349

require 'colorize'

class Board
  def initialize
    @codepegs
    @keypegs
  end
end

# test colorize
require 'colorize'

puts String.color_samples

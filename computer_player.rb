# computer_player.rb

require './game_constants'
require './player'

class ComputerPlayer < Player
  include GameConstants

  def choose_code
    4.times { @master_code.push(GameConstants::COLORS.sample) }
    @master_code
  end

  def show_code
    p @master_code
  end

  def rate_guess(guess_array)
    master_copy = @master_code.clone
    keypeg_array = []

    guess_array.each_with_index do |peg, index|
      if master_copy[index] == peg
        keypeg_array.push('r')
        guess_array[index] = 'x'
        master_copy[index] = 'x'
        puts "Find exact copies -- index #{index} peg #{peg}"
        puts "guess_array: #{guess_array}"
        puts "master_copy: #{master_copy}"
        puts "master_code: #{@master_code}"
      end
    end

    guess_array.each_with_index do |peg, index|
      puts "Find color matches -- index #{index} peg #{peg}"
      master_index = peg == 'x' ? nil : master_copy.find_index(peg)
      puts "master_index = #{master_index}"
      if master_index
        keypeg_array.push('w')
        master_copy[master_index] = 'x'
        puts "keypeg_array: #{keypeg_array}"
        puts "master_copy: #{master_copy}"
        puts "master_code: #{@master_code}"
      end
    end
    keypeg_array
  end
end

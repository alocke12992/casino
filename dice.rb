class Dice
  attr_accessor

  def initialize
    @dice = rand(1..6)
  end

  def roll_dice
    puts @dice
  end

end

puts "How many dice?"
@num = gets.strip.to_i


def rolling
  number = 0
  until number == @num
    @dice_roll = Dice.new
    @total = []
    @total << @dice_roll.roll_dice

    number += 1
  end
  @total.join(' ')
end

puts
puts "You rolled:"
rolling

require 'pry'
require_relative 'roulette_table'
class Roulette
  attr_accessor :color, :number

  def initialize 
    @colors = %w(red black)
    @numbers = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    @result = []
    generate_result
  end

  def generate_result
    @colors.each do |colors|
      @numbers.each do |numbers|
        even = ( numbers %2 == 0 ) ? 'Even' : 'Odd'
      @result << Table.new(colors, numbers)
      end
    end
    new_roll
    binding.pry
  end

  def new_roll
    game = @result.sample
    puts game 
  end
end

roulette = Roulette.new
roulette

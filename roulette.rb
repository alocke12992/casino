require 'pry'
require_relative 'roulette_table'
class Roulette
  attr_accessor :colors, :numbers, :player, :casino 

  def initialize(player, casino)
    @player = player 
    @casino = casino
    @colors = %w(red black)
    @numbers = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    @result = []
  end

  def play_game
    run 
    #ADD YOUR WELCOME MENU HERE# 
  end 

  def generate_result
    @colors.each do |colors|
      @numbers.each do |numbers|
        even = ( numbers %2 == 0 ) ? 'Even' : 'Odd'
      @result << Table.new(colors, numbers, even )
      end
    end
  end

  def new_roll
    result = @result.sample
    numbers = result.numbers
    colors = result.colors
    
    puts numbers
    puts colors
  end

  def run  
    generate_result
    new_roll
  end
end


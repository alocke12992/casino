
require 'pry'

class Slots
  attr_reader :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
  end

  def play_game
    puts '1) Play Game'
    puts '2) exit to casino'
    choice = gets.to_i
    if choice == 1
      play_game 
    elsif choice == 2
      @casino.menu
    else 
      puts "invlaid input, try again"
      play_game
    end
  end

  def make_bet
    puts "What would you like to bet?"
    user_bet = gets.strip.to_i 
    @bet = user_bet 
    @player.wallet -= @bet
    puts "your bet was #{@bet}" 
    puts "your wallet is now #{@player.wallet}"
    binding.pry 
  end 

  def play_game 
    puts "first you must make a bet"
    make_bet
  end 

end 
 

require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
#require_relative 'high_low'

class Casino
  attr_accessor :player, :wallet 

  def initialize
    @player = Player.new

  end

  def welcome_start
    @player.welcome 
    @wallet = @player.wallet
    menu(@wallet)
  end 
  
  def main_wallet 
    
  end 

  def menu(wallet)
    puts "===DPL CASINO==="
    puts "you currently have $#{@wallet} in your wallet"
    puts "Select a game"
    puts "1) Slots"
    puts "2) Roulette"
    puts "3) High - Low"
    puts "4) Leave Casino"
    enter_game = gets.to_i
  
    case enter_game 
      when 1
        Slots.new(@wallet, @player, self).play_game

      when 2
        Roulette.new(@player, self).play_game
      when 3
        puts "High Low under construction"
      when 4
        puts "Goodbye"
        exit
      else
        puts "Invalid Choice"
        menu
    end
  end
end 

casino = Casino.new
casino.welcome_start


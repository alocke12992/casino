require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
require_relative 'rock_paper_scissors'
require_relative 'high_low'

class Casino
  attr_accessor :player, :wallet 

  def initialize
    @player = Player.new

  end

  def welcome_start
    @player.welcome 
    wallet
    menu(@wallet)
  end 
   
  def wallet 
    @wallet = 0 
    @wallet += @player.wallet
  end 

  def menu(wallet) 
    if @wallet > 0
      image = <<IMAGE 
      
 ÛÛÛÛÛÛÛÛÛÛ   ÛÛÛÛÛÛÛÛÛÛÛ  ÛÛÛÛÛ            ÛÛÛÛÛÛÛÛÛ                     ÛÛÛ                     
°°ÛÛÛ°°°°ÛÛÛ °°ÛÛÛ°°°°°ÛÛÛ°°ÛÛÛ            ÛÛÛ°°°°°ÛÛÛ                   °°°                      
 °ÛÛÛ   °°ÛÛÛ °ÛÛÛ    °ÛÛÛ °ÛÛÛ           ÛÛÛ     °°°   ÛÛÛÛÛÛ    ÛÛÛÛÛ  ÛÛÛÛ  ÛÛÛÛÛÛÛÛ    ÛÛÛÛÛÛ 
 °ÛÛÛ    °ÛÛÛ °ÛÛÛÛÛÛÛÛÛÛ  °ÛÛÛ          °ÛÛÛ          °°°°°ÛÛÛ  ÛÛÛ°°  °°ÛÛÛ °°ÛÛÛ°°ÛÛÛ  ÛÛÛ°°ÛÛÛ
 °ÛÛÛ    °ÛÛÛ °ÛÛÛ°°°°°°   °ÛÛÛ          °ÛÛÛ           ÛÛÛÛÛÛÛ °°ÛÛÛÛÛ  °ÛÛÛ  °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ
 °ÛÛÛ    ÛÛÛ  °ÛÛÛ         °ÛÛÛ      Û   °°ÛÛÛ     ÛÛÛ ÛÛÛ°°ÛÛÛ  °°°°ÛÛÛ °ÛÛÛ  °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ
 ÛÛÛÛÛÛÛÛÛÛ   ÛÛÛÛÛ        ÛÛÛÛÛÛÛÛÛÛÛ    °°ÛÛÛÛÛÛÛÛÛ °°ÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛ  ÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛ°°ÛÛÛÛÛÛ 
°°°°°°°°°°   °°°°°        °°°°°°°°°°°      °°°°°°°°°   °°°°°°°° °°°°°°  °°°°° °°°° °°°°°  °°°°°°  
                                                                                                                               
IMAGE
      sleep(1)
      puts image.colorize(:red)
      puts "Current Wallet:"
        if @wallet >= 100 
          puts "$#{@wallet}".colorize(:green)
        else 
          puts "$#{@wallet}".colorize(:yellow)
        end 
      puts "Select a game"
      puts "1) Slots"
      puts "2) Roulette"
      puts "3) Rock Paper Scissors"
      puts "4) High - Low"
      puts "5) Leave Casino"
      enter_game = gets.to_i
    
      case enter_game 
        when 1
          Slots.new(@wallet, @player, self).play_game

        when 2
          Roulette.new(@wallet, @player, self).play_game
    
        when 3
          RockPaperScissor.new(@wallet, @player, self).play_game
        when 4
          Highlow.new(@wallet, @player, self).play_game
        when 5
          puts "Goodbye"
          exit
        else
          puts "Invalid Choice"
          menu
      end
    else 
      puts "Sorry, you've run out of money, come again soon."
      exit 
    end 
  end
end 

casino = Casino.new
casino.welcome_start


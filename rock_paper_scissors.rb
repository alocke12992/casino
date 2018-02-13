require 'colorize'

  class RockPaperScissor
    attr_accessor  :player, :casino, :wallet

    def initialize(wallet, player, casino)
      @player = player
      @casino = casino
       @wallet = wallet 
    end
  
    def play_game
      image = <<IMAGE


 ÛÛÛÛÛÛÛÛÛÛÛ                     ÛÛÛÛÛ         ÛÛÛÛÛÛÛÛÛÛÛ                                             ÛÛÛÛÛÛÛÛÛ            ÛÛÛ                                            
°°ÛÛÛ°°°°°ÛÛÛ                   °°ÛÛÛ         °°ÛÛÛ°°°°°ÛÛÛ                                           ÛÛÛ°°°°°ÛÛÛ          °°°                                             
 °ÛÛÛ    °ÛÛÛ   ÛÛÛÛÛÛ   ÛÛÛÛÛÛ  °ÛÛÛ ÛÛÛÛÛ    °ÛÛÛ    °ÛÛÛ  ÛÛÛÛÛÛ   ÛÛÛÛÛÛÛÛ   ÛÛÛÛÛÛ  ÛÛÛÛÛÛÛÛ    °ÛÛÛ    °°°   ÛÛÛÛÛÛ  ÛÛÛÛ   ÛÛÛÛÛ   ÛÛÛÛÛ   ÛÛÛÛÛÛ  ÛÛÛÛÛÛÛÛ   ÛÛÛÛÛ 
 °ÛÛÛÛÛÛÛÛÛÛ   ÛÛÛ°°ÛÛÛ ÛÛÛ°°ÛÛÛ °ÛÛÛ°°ÛÛÛ     °ÛÛÛÛÛÛÛÛÛÛ  °°°°°ÛÛÛ °°ÛÛÛ°°ÛÛÛ ÛÛÛ°°ÛÛÛ°°ÛÛÛ°°ÛÛÛ   °°ÛÛÛÛÛÛÛÛÛ  ÛÛÛ°°ÛÛÛ°°ÛÛÛ  ÛÛÛ°°   ÛÛÛ°°   ÛÛÛ°°ÛÛÛ°°ÛÛÛ°°ÛÛÛ ÛÛÛ°°  
 °ÛÛÛ°°°°°ÛÛÛ °ÛÛÛ °ÛÛÛ°ÛÛÛ °°°  °ÛÛÛÛÛÛ°      °ÛÛÛ°°°°°°    ÛÛÛÛÛÛÛ  °ÛÛÛ °ÛÛÛ°ÛÛÛÛÛÛÛ  °ÛÛÛ °°°     °°°°°°°°ÛÛÛ°ÛÛÛ °°°  °ÛÛÛ °°ÛÛÛÛÛ °°ÛÛÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °°° °°ÛÛÛÛÛ 
 °ÛÛÛ    °ÛÛÛ °ÛÛÛ °ÛÛÛ°ÛÛÛ  ÛÛÛ °ÛÛÛ°°ÛÛÛ     °ÛÛÛ         ÛÛÛ°°ÛÛÛ  °ÛÛÛ °ÛÛÛ°ÛÛÛ°°°   °ÛÛÛ         ÛÛÛ    °ÛÛÛ°ÛÛÛ  ÛÛÛ °ÛÛÛ  °°°°ÛÛÛ °°°°ÛÛÛ°ÛÛÛ °ÛÛÛ °ÛÛÛ      °°°°ÛÛÛ
 ÛÛÛÛÛ   ÛÛÛÛÛ°°ÛÛÛÛÛÛ °°ÛÛÛÛÛÛ  ÛÛÛÛ ÛÛÛÛÛ    ÛÛÛÛÛ       °°ÛÛÛÛÛÛÛÛ °ÛÛÛÛÛÛÛ °°ÛÛÛÛÛÛ  ÛÛÛÛÛ       °°ÛÛÛÛÛÛÛÛÛ °°ÛÛÛÛÛÛ  ÛÛÛÛÛ ÛÛÛÛÛÛ  ÛÛÛÛÛÛ °°ÛÛÛÛÛÛ  ÛÛÛÛÛ     ÛÛÛÛÛÛ 
°°°°°   °°°°°  °°°°°°   °°°°°°  °°°° °°°°°    °°°°°         °°°°°°°°  °ÛÛÛ°°°   °°°°°°  °°°°°         °°°°°°°°°   °°°°°°  °°°°° °°°°°°  °°°°°°   °°°°°°  °°°°°     °°°°°°  
                                                                      °ÛÛÛ                                                                                                 
                                                                      ÛÛÛÛÛ                                                                                                
                                                                     °°°°°                                                                                                 

IMAGE
      puts image 
      welcome 
    end 
    def welcome 
      puts "your wallet is $#{@wallet}".colorize(:cyan)
      puts "Welcome to Rock, Paper, Scissor"
      puts "1) Play Game"
      puts "2) Exit to casino"
      choice = gets.strip.to_i
      if choice == 1
        make_bet 
      elsif choice == 2
        puts "Thanks for playing Rock Paper Scissors. Good Bye."
        @casino.menu(@wallet)
      else 
        puts "Invalid input, please try again"
        play_game 
      end 
    end 

    def start 
      puts "1) Press 1 to input Rock"
      puts "2) Press 2 to input Paper"
      puts "3) Press 3 to input Scissor"
      @user_input = gets.to_i
      computation
    end
    
    def make_bet
      puts "What would you like to bet?".colorize(:cyan)
      user_bet = gets.strip.to_i 
      @user_bet = user_bet 
      @wallet -= @user_bet
      puts "your bet was $#{@user_bet}".colorize(:cyan)
      start 
    end 

    def computation
      @options = [0, 1, 2]
      comp_index = @options.sample
      user_index = @options[@user_input -1]
    
      case comp_index 
        when 0
          sleep(1)
          puts "the computer went with rock"
          if user_index == 0
            sleep(1)
            puts 'it is a tie'.colorize(:yellow)
            sleep(1)
          elsif user_index == 1
            sleep(1)
            puts 'You win!'.colorize(:green)
            sleep(1)
          else 
            sleep(1)
            puts 'Sorry, you lose.'.colorize(:red)
            sleep(1)
          end
        when 1
          sleep(1)
          puts "the computer went with paper"
          if user_index == 1
             sleep(1)
            puts 'it is a tie'.colorize(:yellow)
            sleep(1)
          elsif user_index == 2
             sleep(1)
            puts 'You win!'.colorize(:green)
            sleep(1)
          else
            sleep(1)
            puts 'Sorry, you lose.'.colorize(:red)
            sleep(1)
          end
        when 2
          sleep(1)
          puts "the computer went with scissor"
          if user_index == 2
            sleep(1)
            puts 'it is a tie'.colorize(:yellow)
            sleep(1)
          elsif user_index == 0
            sleep(1)
            puts 'You win!'.colorize(:green)
            sleep(1)
          else
            sleep(1)
            puts 'Sorry, you lose.'.colorize(:red)
            sleep(1)
        end 
      end
    welcome 
  end
end 

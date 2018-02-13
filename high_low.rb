require 'colorize'
#require menu.rb

class Highlow

attr_accessor  :player, :casino, :wallet

  def initialize(wallet, player, casino)
    @player = player
    @casino = casino
    @wallet = wallet 
  end


  def play_game 
    image = <<IMAGE

 ÛÛÛÛÛ   ÛÛÛÛÛ  ÛÛÛ           ÛÛÛÛÛ                       ÛÛÛÛÛ                               
°°ÛÛÛ   °°ÛÛÛ  °°°           °°ÛÛÛ                       °°ÛÛÛ                                
 °ÛÛÛ    °ÛÛÛ  ÛÛÛÛ   ÛÛÛÛÛÛÛ °ÛÛÛÛÛÛÛ                    °ÛÛÛ         ÛÛÛÛÛÛ  ÛÛÛÛÛ ÛÛÛ ÛÛÛÛÛ
 °ÛÛÛÛÛÛÛÛÛÛÛ °°ÛÛÛ  ÛÛÛ°°ÛÛÛ °ÛÛÛ°°ÛÛÛ     ÛÛÛÛÛÛÛÛÛÛ    °ÛÛÛ        ÛÛÛ°°ÛÛÛ°°ÛÛÛ °ÛÛÛ°°ÛÛÛ 
 °ÛÛÛ°°°°°ÛÛÛ  °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ    °°°°°°°°°°     °ÛÛÛ       °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ 
 °ÛÛÛ    °ÛÛÛ  °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ                   °ÛÛÛ      Û°ÛÛÛ °ÛÛÛ °°ÛÛÛÛÛÛÛÛÛÛÛ  
 ÛÛÛÛÛ   ÛÛÛÛÛ ÛÛÛÛÛ°°ÛÛÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛ                  ÛÛÛÛÛÛÛÛÛÛÛ°°ÛÛÛÛÛÛ   °°ÛÛÛÛ°ÛÛÛÛ   
°°°°°   °°°°° °°°°°  °°°°°ÛÛÛ°°°° °°°°°                  °°°°°°°°°°°  °°°°°°     °°°° °°°°    
                     ÛÛÛ °ÛÛÛ                                                                 
                    °°ÛÛÛÛÛÛ                                                                  
                     °°°°°°                                                                   
IMAGE
    puts image 
    puts "\n\nWelcome to High Low\nThe number min is 1 and max is 100\n\n".light_magenta
    if @wallet != 0
      puts "You currently have $#{@wallet} left to play with.".colorize(:green)
      puts "Would you like to:\n1. Play a game?\n2. Exit to Casino"
      @casino.wallet = @wallet
      choice = gets.to_i
      if choice == 1
        place_bet 
      elsif choice == 2
        puts "Thanks for playing High-Low! Come again soon!"
        sleep(1)
        @casino.menu(@wallet)
      else
        puts "Invalid Entry"
          welcome
      end
    else
      puts "sorry, you've run out of money".colorize(:red)
      sleep(1)
      puts "goodbye"
      exit
    end
  end

  def place_bet
    print "\nYou have $#{@wallet}, how much do you want to bet?\n$".light_green
    @bet = gets.strip.to_i
    @new = @wallet - @bet
      analyze
  end


  def analyze
    continue = true
    until continue == false
      @number = rand(1..100)
      puts "\nThe first number is: #{@number}".light_cyan
      puts "Do you think the second number will be higher or lower?\n".light_cyan
      @second_number = rand(1..100)
      guess = gets.strip
      message = "The second number was: #{@second_number}".light_yellow
      if @second_number == @number
        sleep(1)
        puts message
        sleep(1)
        puts "\nThe nubers were the same, we are tied."
        sleep(1)
      elsif ((@second_number > @number) && (guess.include? 'hi'))||((@second_number < @number) && (guess.include? 'lo'))
        sleep(1)
        puts message
        sleep(1)
        print" ⭐️ " * 10 
        print "\nYou guest right! You win $#{@bet*2}!".colorize(:green)
        puts " ⭐️ " * 10
        sleep(1)
        @win = true
        @wallet = @new +(@bet*2)
      elsif ((@second_number > @number) && (guess.include? 'lo'))||((@second_number < @number) && (guess.include? 'hi'))
        sleep(1)
        puts message
        sleep(1)
        puts "\nYou lose".colorize(:red)
        sleep(1)
        
        @win = false
        @wallet -= @bet
      elsif (guess.include? 'quit')||(guess.include? 'exit')||(guess.include? 'done')
        # continue = false
        puts "\nYou walk away with $#{@new} in your pocket".colorize(:light_magenta)
        @casino.menu(@wallet)
      else
        puts "\nInvalid input, try again".colorize(:light_red)
        @new += @bet
        analyze
      end 
      sleep(1)
      play_game 
    end
  end
end 


# require_relative 'slot_machine'
require 'pry'
require 'colorize'

class Slots
  attr_reader :player, :casino, :wallet

  def initialize(wallet, player, casino)
    @player = player
    @casino = casino
    @wallet = wallet 
  end


  def play_game
    puts "*".colorize(:cyan) * 40
    
    image = <<IMAGE

  ÛÛÛÛÛÛÛÛÛ  ÛÛÛÛ            ÛÛÛÛÛ           
 ÛÛÛ°°°°°ÛÛÛ°°ÛÛÛ           °°ÛÛÛ            
°ÛÛÛ    °°°  °ÛÛÛ   ÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ    ÛÛÛÛÛ 
°°ÛÛÛÛÛÛÛÛÛ  °ÛÛÛ  ÛÛÛ°°ÛÛÛ°°°ÛÛÛ°    ÛÛÛ°°  
 °°°°°°°°ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ  °ÛÛÛ    °°ÛÛÛÛÛ 
 ÛÛÛ    °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ  °ÛÛÛ ÛÛÛ °°°°ÛÛÛ
°°ÛÛÛÛÛÛÛÛÛ  ÛÛÛÛÛ°°ÛÛÛÛÛÛ   °°ÛÛÛÛÛ  ÛÛÛÛÛÛ 
 °°°°°°°°°  °°°°°  °°°°°°     °°°°°  °°°°°°  
                               
IMAGE

    puts "\n"
    puts image.colorize(:cyan)
    puts "\n" 
    puts "*".colorize(:cyan) * 40 
    puts '1) Play Game'
    puts '2) exit to casino'
    choice = gets.to_i
    if choice == 1
      welcome 
    elsif choice == 2

      @casino.menu(@wallet)
    else 
      puts "invlaid input, try again".colorize(:red)
      play_game
    end
  end

  def  welcome
    puts "first you must make a bet".colorize(:cyan)
    make_bet
  end 

  def make_bet
    puts "What would you like to bet?".colorize(:cyan)
    user_bet = gets.strip.to_i 
    @user_bet = user_bet 
    @wallet -= @user_bet
    puts "your bet was $#{@user_bet}".colorize(:cyan)
    puts "your wallet is now $#{@wallet}".colorize(:cyan)
    run_slots
  end 



  def run_slots 
    @num = [1,2,3]
    @slot_A = [" 🔶 "," 🔷 "," 🔸 "," 🔹 "]
    @slot_B = [" 🔶 "," 🔷 "," 🔸 "," 🔹 "]
    @slot_C = [" 🔶 "," 🔷 "," 🔸 "," 🔹 "]
    @a = 0
    @b = 0
    @c = 0
    @i = 0
    while @i < 10
        @a = @slot_A.sample
        @b = @slot_B.sample
        @c = @slot_C.sample
        rand_num = @num.sample
      case rand_num
      when 1 
        sleep(0.5)
        puts "#{@a} #{@b} #{@c}".colorize(:purple)
      when 2
        sleep(0.5)
        puts "#{@a} #{@b} #{@c}".colorize(:red)
      when 3 
        sleep(0.5)
        puts "#{@a} #{@b} #{@c}".colorize(:blue)
      end 
        @i += 1
    end 
        prize(@user_bet) 
    end    

  def prize(bet) 
    if @a == @b || @a == @c || @b == @c 
      @user_bet += bet * 2 
      puts "WINNER!".colorize(:green)
      puts @user_bet
    elsif @a == @b && @a == @c
      @user_bet += bet * 5
      puts "JackPot!".colorize(:green)
      puts @user_bet
    else
      puts "You Lose, Better Luck Next Time".colorize(:red)
      @user_bet = 0 
    end
    # puts "Your initial bet was: $".colorize(:green)
    puts  "You won $#{@user_bet} this round".colorize(:green)
    @wallet += @user_bet 
    puts "You have $#{@wallet} left in your wallet.".colorize(:cyan)
    @casino.wallet = @wallet
  play_game
  end

end 
  

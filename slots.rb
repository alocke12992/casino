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
    puts '1) Play Game'
    puts '2) exit to casino'
    choice = gets.to_i
    if choice == 1
      welcome 
    elsif choice == 2

      @casino.menu(@wallet)
    else 
      puts "invlaid input, try again"
      play_game
    end
  end

  def  welcome
    puts "first you must make a bet"
    make_bet
  end 

  def make_bet
    puts "What would you like to bet?"
    user_bet = gets.strip.to_i 
    @user_bet = user_bet 
    @wallet -= @user_bet
    puts "your bet was #{@user_bet}" 
    puts "your wallet is now #{@wallet}"
    run_slots
  end 



  def run_slots 
    @slot_A = [1,2,3,4,5]
    @slot_B = [1,2,3,4,5]
    @slot_C = [1,2,3,4,5]
    @a = 0
    @b = 0
    @c = 0
    @i = 0
    while @i < 10
        @a = @slot_A.sample.to_i
        @b = @slot_B.sample.to_i
        @c = @slot_C.sample.to_i
        puts "#{@a} #{@b} #{@c}".colorize(:green)
        puts "#{@a} #{@b} #{@c}".colorize(:red)
        puts "#{@a} #{@b} #{@c}".colorize(:blue)
        @i += 1
    end 
        prize(@user_bet) 
    end  

  def prize(bet) 
    if @a == @b || @a == @c || @b == @c 
      @user_bet += bet * 2 
      puts "WINNER!"
      puts @user_bet
    elsif @a == @b && @a == @c
      @user_bet += bet * 5
      puts "JackPot!"
      puts @user_bet
    else
      puts "You Lose, Better Luck Next Time"
      @user_bet = 0 
    end
    # puts "Your initial bet was: $".colorize(:green)
    puts  "You currently have $#{@user_bet} to play with".colorize(:green)
    @wallet += @user_bet 
    puts @wallet 
  play_game
  end

end 
  

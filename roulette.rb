require 'pry'
require_relative 'roulette_table'
require 'colorize'

class Roulette
  attr_accessor :colors, :numbers, :player, :casino, :wallet

  def initialize(wallet, player, casino)
    @player = player
    @casino = casino
    @wallet = wallet
    @colors = %w(Red Black)
    @numbers = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    @result = []
  end

  def play_game
    image = <<IMAGE

 ÛÛÛÛÛÛÛÛÛÛÛ                       ÛÛÛÛ            ÛÛÛÛÛ     ÛÛÛÛÛ            
°°ÛÛÛ°°°°°ÛÛÛ                     °°ÛÛÛ           °°ÛÛÛ     °°ÛÛÛ             
 °ÛÛÛ    °ÛÛÛ   ÛÛÛÛÛÛ  ÛÛÛÛÛ ÛÛÛÛ °ÛÛÛ   ÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ   ÛÛÛÛÛÛÛ    ÛÛÛÛÛÛ 
 °ÛÛÛÛÛÛÛÛÛÛ   ÛÛÛ°°ÛÛÛ°°ÛÛÛ °ÛÛÛ  °ÛÛÛ  ÛÛÛ°°ÛÛÛ°°°ÛÛÛ°   °°°ÛÛÛ°    ÛÛÛ°°ÛÛÛ
 °ÛÛÛ°°°°°ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ  °ÛÛÛ °ÛÛÛÛÛÛÛ   °ÛÛÛ      °ÛÛÛ    °ÛÛÛÛÛÛÛ 
 °ÛÛÛ    °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ °ÛÛÛ  °ÛÛÛ °ÛÛÛ°°°    °ÛÛÛ ÛÛÛ  °ÛÛÛ ÛÛÛ°ÛÛÛ°°°  
 ÛÛÛÛÛ   ÛÛÛÛÛ°°ÛÛÛÛÛÛ  °°ÛÛÛÛÛÛÛÛ ÛÛÛÛÛ°°ÛÛÛÛÛÛ   °°ÛÛÛÛÛ   °°ÛÛÛÛÛ °°ÛÛÛÛÛÛ 
°°°°°   °°°°°  °°°°°°    °°°°°°°° °°°°°  °°°°°°     °°°°°     °°°°°   °°°°°°  

IMAGE

    puts image 
    if @wallet != 0
      puts "You currently have $#{@wallet} left to play with.".colorize(:green)
      puts "Would you like to:\n1. Play a game?\n2. Exit to Casino"
      @casino.wallet = @wallet
      choice = gets.to_i
      if choice == 1
        make_bet
      elsif choice == 2
        puts "Thanks for playing Roulette! Come again soon!"
        @casino.menu(@wallet)
      else
        puts "Invalid Entry"
        play_game
      end
    else
      puts "sorry, you've run out of money".colorize(:red)
      sleep(1)
      puts "goodbye"
      exit
    end
  end

  def make_choice
    puts "Would you like to bet on:\n1. Even or Odd\n2. Color"
    user_choice = gets.to_i
      if user_choice == 1
        even_or_odd
      elsif user_choice == 2
        color
      else
        "Invalid input"
        make_choice
      end
  end

  def make_bet
   puts "What would you like to bet?"
   user_bet = gets.strip.to_i
   @bet = user_bet
   make_choice
 end

  def even_or_odd
    puts "Would you like to bet on\n1. Even\n2. Odd"
    even_input = gets.to_i
    if even_input == 1
    run
      if @number % 2 === 0
        winner
      else
        loser
      end
    elsif even_input == 2
      run
        if @number % 2 === 1
          winner.colorize(:green)
        else
          loser.colorize(:red)
        end
    else
        puts "Invalid Input".colorize(:red)
        even_or_odd
    end
  end

  def winner
    puts "You win!".colorize(:green)
    @wallet += @bet
    puts "your bet was #{@bet}"
    puts "your wallet is now #{@wallet}"
    play_game
  end

  def loser
    puts "You lose.".colorize(:red)
    @wallet -= @bet
    puts "your bet was #{@bet}"
    puts "your wallet is now #{@wallet}"
    play_game
  end

  def color
    puts "Would you like to bet on\n1. Black\n2. Red"
    even_input = gets.to_i
    if even_input == 1
      run
      if @color == 'Black'
        winner
      else
        loser
      end
    elsif even_input == 2
      run
        if @color == 'Red'
          winner
        else
          loser
        end
    else
      puts 'Invalid Input'
      color
    end
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
    @number = result.numbers.to_i
    @color = result.colors

    puts "#{@number}".colorize(:cyan)
    puts "#{@color}".colorize(:magenta)
  end

  def run
    generate_result
    new_roll
  end
end

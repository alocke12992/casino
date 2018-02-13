require 'pry'
require_relative 'roulette_table'
require_relative 'main'
class Roulette
  attr_accessor :colors, :numbers, :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    @colors = %w(Red Black)
    @numbers = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    @result = []
  end

  def play_game
    puts "Would you like to:\n1. Play a game?\n2. Quit"
    choice = ""
    choice = gets.to_i
    if choice == 1
      make_bet
    elsif choice == 2
      @casino.menu
    else
      puts "Invalid Entry"
      play_game
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
      if numbers == 'Even'
        winner
      else
        loser
      end
    elsif even_input == 2
      run
        if numbers != 'Even'
          winner
        else
          loser
        end
    else
        puts "Invalid Input"
        even_or_odd
    end
  end

  def winner
    puts "You win!"
    @player.wallet += @bet
    puts "your bet was #{@bet}"
    puts "your wallet is now #{@player.wallet}"
    play_game
  end

  def loser
    puts "You lose."
    @player.wallet -= @bet
    puts "your bet was #{@bet}"
    puts "your wallet is now #{@player.wallet}"
    play_game
  end

  def color
    puts "Would you like to bet on\n1. Black\n2. Red"
    even_input = gets.to_i
    if even_input == 1 || even_input == 2
      run
      if colors == colors
        winner
      elsif
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

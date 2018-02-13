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
    @stars = "*"*60
    line = "_"*60
    fat_line = "#"*60
    puts `clear`
    puts "\n\n"
    puts line.green
    puts fat_line.magenta
    puts @stars.blue
    puts "\n\nWelcome to High Low\nThe number min is 1 and max is 100\n\n".light_magenta
    welcome
  end 

  def welcome 
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
        sleep 1
        puts "\nThe nubers were the same, we are tied."
        puts message
      elsif ((@second_number > @number) && (guess.include? 'hi'))||((@second_number < @number) && (guess.include? 'lo'))
        sleep 1
        puts "\nYou guest right! You win $#{@bet*2}!".green
        puts message
        @win = true
        @wallet = @new +(@bet*2)
      elsif ((@second_number > @number) && (guess.include? 'lo'))||((@second_number < @number) && (guess.include? 'hi'))
        sleep 1
        puts "\nYou lose".red
        puts message
        @win = false
        @wallet -= @bet
      elsif (guess.include? 'quit')||(guess.include? 'exit')||(guess.include? 'done')
        # continue = false
        puts "\nYou walk away with $#{@new} in your pocket".light_magenta
        exit(0)
      else
        puts "\nInvalid input, try again".light_red
        @new += @bet
        analyze
      end
      puts @stars.blue
      welcome
    end
  end
end 


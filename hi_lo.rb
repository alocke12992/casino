# require_relative 'dice'
# require 'colorize'
# require 'pry'
#
# puts "\nWelcome to High Low\n"
# puts "There are three dice. So max number is 18 and minimum number is 3"
#
# def dice_roll
#   rand(3..18)
# end
#
# first = dice_roll
# second = dice_roll
#
#
#
#
# def analysis
#   puts "\nFirst dice roll is: #{first}"
#
#   puts "\nWill the next roll be:
#   1: higher or
#   2: lower?
#   3: to quit"
#
#   if second > first && @choice == 1
#     puts "You win"
#   elsif second < first && choice == 1
#     puts "You lose"
#   elsif second > first && choice == 2
#     puts "You lose"
#   elsif second < first && choice == 2
#     puts "You win"
#   else second == first
#     puts "You tie"
#   end
# end
#
# puts "something"
#
# @finished = false
# def game
#   until @finished == true
#     choice = gets.strip.to_i
#     if choice.include? 'quit'
#       exit(0)
#
#     else
#       analysis
#     end
#   end
# end
#
#
# game




require 'colorize'
require 'pry'

stars = "*"*25
puts stars.blue
puts "\nWelcome to High Low\n"
puts "There are three dice. So max number is 18 and minimum number is 3"
puts stars.blue

def dice_roll
  rand(3..18)
end


values = ['higher', 'lower']

@choice = gets.chomp


def analysis
  win = puts "You win"
  lose = puts "You lose"
  tie = puts "You tie"

  if @choice.include? 'higher'
    if @second > @first
      win
    elsif @second < @first
      lose
    else @second == @first
      tie
    end
  elsif @choice.include? 'higher'
    if @second > @first
      lose
    elsif @second < @first
      win
    else @second == @first
      tie
    end
  else
    puts "Invalid input, try agian."
  end
end

@finished = false

def game
  until @finished == true

    @first = dice_roll
    @second = dice_roll

    stars = "*"*25
    puts stars.blue

    puts "\nFirst dice roll is: #{@first}"

    puts "\nWill the next roll be:
    higher or
    lower?
    Or type 'quit' to quit"

    puts "You said the second roll will be #{@choice}\nSecond dice roll is: #{@second}"

    if @choice.include? 'quit'
      @finished = true
      exit(0)
    else
      analysis
    end
  end
end


game

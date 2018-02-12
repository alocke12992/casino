require_relative 'player'
require_relative 'slots'
require_relative 'roulette'
#require_relative 'high_low'

class Casino
  attr_reader :player

  def initialize
    @player = Player.new
  end

  def welcome_start
    @player.welcome
    menu
  end 

  def menu
    puts "===DPL CASINO==="
    puts "Select a game"
    puts "1) Slots"
    puts "2) Roulette"
    puts "3) High - Low"
    puts "4) Leave Casino"
    enter_game(gets.to_i)
  end

  def enter_game(choice)
    case choice
      when 1
        Slots.new(@player, self).play_game
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


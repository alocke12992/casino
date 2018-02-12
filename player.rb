require 'pry'
class Player

  attr_accessor :name, :wallet

  def initialize
    @name = name
    @wallet = wallet
  end

  def welcome 
    puts "welcome"
    puts "What is your name?"
    @name = gets.strip
    puts "how much is in your wallet?"
    @wallet = gets.strip.to_i 
    puts "#{@name}, you have #{@wallet} in your wallet."
    binding.pry
  end 
end




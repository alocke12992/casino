require_relative 'player'
class Welcome 


  def initialize 
    @person = Person.new(@person.name, @person.wallet)
  end 

  def welcome 
    puts "welcome"
    puts "what is your name?"
    @name = gets.strip
    puts "what is in your wallet?"
    @wallet = gets.strip.to_i
  end 
end 

test = Welcome.new
test.welcome


  class RockPaperScissor
    attr_accessor  :player, :casino, :wallet

    def initialize(wallet, player, casino)
      @player = player
      @casino = casino
       @wallet = wallet 
    end
  
    def play_game

      puts "Welcome to Rock, Paper, Scissor"
      puts "1) Press 1 to input Rock"
      puts "2) Press 2 to input Paper"
      puts "3) Press 3 to input Scissor"
      puts "4) Exit to Casino"
      @user_input = gets.to_i
      if @user_input == 4
        puts "Good Bye"
        @casino.menu(@wallet)
      else
      computation
      end
    end
    

    def computation
      @options = [0, 1, 2]
      comp_index = @options.sample
      user_index = @options[@user_input -1]
      
    
    #   if @options[user_index -1] == comp_index
    #     puts "Computer wins!"
    #   elsif comp_choice == @user_input
    #     puts "It's a draw"
    #   else
    #     puts "You win the game"
    #   end

      case comp_index 
        when 0
          puts "the computer went with rock"
          if user_index == 0
            puts 'tie'
          elsif user_index == 1
            puts 'win'

          else 
            puts 'lose'
          end
        when 1
          puts "the computer went with paper"
          if user_index == 1
            puts 'tie'
          elsif user_index == 2
            puts "win"
          else
            puts 'lose'
          end
        when 2
          puts "the computer went with scissor"
          if user_index == 2
            puts 'tie'
          elsif user_index == 0
           puts 'win'
          else
            puts 'lose'
          end
      end
  end
end 

require_relative 'Game.rb'
require_relative 'Board.rb'
require_relative 'Player.rb'
require_relative 'Computer.rb'
require_relative 'Human.rb'

@playerWins = 0
@computerWins = 0

def game_start
    puts "Welcome to Tic Tac Toe!"
    puts "Do you want to go first? [y/n]"
    if gets.strip == 'y'
        first = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new, 1, @playerWins, @computerWins, rand(3))
        first.play
        @playerWins = first.player_wins
        @computerWins = first.computer_wins
    else
        second = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new, 2, @playerWins, @computerWins, rand(3))
        second.play
        @playerWins = second.player_wins
        @computerWins = second.computer_wins
    end

    puts "Would you like to play again? [y/n]"
end
game_start
game_start until gets.strip == "n"

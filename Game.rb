require_relative 'Board.rb'
require_relative 'Player.rb'
require_relative 'Computer.rb'
require_relative 'Human.rb'

class Game

    attr_accessor :board, :player1, :player2, :winner, :user_input, :player_num, :player_wins, :computer_wins, :difficulty

    WIN = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], #horizontal wins
        [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical wins
        [0, 4, 8], [2, 4, 6]             #diagonal wins
    ]

    def initialize(player1, player2 , board, num, playerWins, computerWins, dif)
        puts "|| Welcome to Tic Tac Toe!!! ||"
        puts "||---------------------------||\n\n"
        @player1 = player1
        @player2 = player2
        @board = board
        @player_num = num
        @player_wins = playerWins
        @computer_wins = computerWins
        @difficulty = dif
        @board.display
    end


    def current_player
        if (board.turnCount%2==0)
            player1
        else
            player2
        end
    end

    def hasWinner
        WIN.each do |line|
            if @board.cells[line[0]] == @board.cells[line[1]] &&
                @board.cells[line[1]] == @board.cells[line[2]] &&
                @board.isTaken(line[0]+1)
                return line
            end
        end
        return false
    end

    def draw
        !hasWinner && @board.isFull ? true : false
    end

    def over
        (draw || hasWinner) ? true : false
    end

    def winner
        if hasWinner
            line = hasWinner
            @board.cells[line[0]]
        end
    end
            
    def turn
        puts "Enter a number between 1 and 9: "
        @user_input = current_player.move(@board, @difficulty)
        if @board.valid_move(@user_input)
            @board.update(@user_input, current_player)
        else puts "Please enter a number between 1 and 9: "
            @board.display
            turn
        end
        @board.display
    end

    def score
        puts "Player has won #{@player_wins} games"
        puts "Computer has won #{@computer_wins} games"
    end

    def taunt
        score
        if @player_wins > @computer_wins
            puts "You have just gotten lucky...brat"
        elsif @computer_wins > @player_wins
            puts "You have been surpassed and you will never ever beat me again"
        else
            puts "We are neck and neck eh? I guess I am a nice person"
        end
    end

    def increment
        if ((@player1.token == winner && @player_num == 1) || (@player2.token == winner && @player_num == 2))
            @player_wins = @player_wins + 1
        else
            @computer_wins = @computer_wins + 1
        end
    end

    def play
        turn until over
        if hasWinner
            if @player1.token == winner && @player_num == 1
                puts "Congratulations to Player 1 who used #{winner}. Maybe I'll win next time :("
            elsif @player1.token == winner 
                puts "Congratulations to myself who bested the player through sheer wit. I used #{winner} and outclassed you"
            elsif @player2.token == winner && @player_num == 2
                puts "Congratulations to Player 1 who used #{winner}. I am so sick of losing"
            else 
                puts "I am the better Tic Tac Toe player. Honestly...you just lost to a bot who used #{winner} and only my pinky toe"
            end
            increment
        elsif draw
            puts "Tie game!"
        end
        taunt
    end

end
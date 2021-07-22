require_relative "board.rb"
require_relative "tile.rb"

class Game

    def initialize
        @board = Board.new
    end

    def play
        while !@board.solved?
            print "Please enter a position and value 'num1 num2' (1-9)"
            input = gets.chomp.split
            pos = [input[0].to_i, input[1].to_i]
            value = input[2]
            raise "invalid position" if !@board.valid_position?(pos)
            @board[pos] = value
            @board.render
        end
        print "You Win!!!!!"
    end


end

b = Game.new
b.play
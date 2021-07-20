require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        self.board.place_random_ships
        puts self.board.num_ships
        self.board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        end
        false
    end

    def win?
        if self.board.num_ships == 0
            print "you win"
            return true
        end
        false
    end

    def game_over?
        return true if lose? || win?
        false
    end
    
    def turn
        if !self.board.attack(@player.get_move)
            @remaining_misses -= 1
        end
        self.board.print
        print @remaining_misses
    end

end

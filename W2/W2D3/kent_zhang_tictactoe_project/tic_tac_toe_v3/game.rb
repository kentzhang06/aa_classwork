require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game
    attr_reader :players, :current_player

    def initialize(n, hash_player_marks)
        @players = []
        hash_player_marks.each do |player_mark, is_computer|
            if is_computer
                @players << ComputerPlayer.new(player_mark)
            else
                @players << HumanPlayer.new(player_mark)
            end
        end
        # @player_1 = HumanPlayer.new(player_1_mark)
        # @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @players[0]
        @board = Board.new(n)
    end



    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position(@board.legal_positions)
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts 'victory player ' + @current_player.mark.to_s
                return
            end
            self.switch_turn
        end
        puts 'draw'
    end

end

# newgame = Game.new(4, :X, :O, :T)
# newgame.switch_turn
# p newgame.current_player
# newgame.switch_turn
# p newgame.current_player
# newgame.switch_turn
# p newgame.current_player
# newgame.switch_turn
# p newgame.current_player
# newgame.switch_turn
# p newgame.current_player

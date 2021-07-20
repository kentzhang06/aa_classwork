require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    attr_reader :players, :current_player

    def initialize(n, *players_mark)
        @players = []
        players_mark.each { |player_mark| @players << HumanPlayer.new(player_mark) }

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
            position = @current_player.get_position
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

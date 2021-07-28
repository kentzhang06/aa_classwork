require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
    include Stepable
    def initialize(pos, board, symbol)
        super
    end

    def symbol
        color
    end

    def move_diffs
        [[1,2], [-1, -2], [-1, 2], [1, -2], [2, 1], [-2, -1], [-2, 1], [2, -1]]
    end
end
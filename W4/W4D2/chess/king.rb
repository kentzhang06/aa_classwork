require_relative 'piece'
require_relative 'stepable'

class King < Piece
    include Stepable
    def initialize(pos, board, symbol)
        super
    end

    def symbol
        color
    end

    def move_diffs
        [[-1. -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    end
end
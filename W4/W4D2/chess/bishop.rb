require_relative 'piece'
require_relative 'slideable'


class Bishop < Piece
  include Slideable

  def initialize(pos, board, symbol)
    super
  end

  def symbol
    @color
  end

  def move_dirs
    diagonal_dirs
  end

end

b = Board.new
bishop = Bishop.new([0, 1], b, :white)
p bishop.moves
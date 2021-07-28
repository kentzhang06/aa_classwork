require_relative 'piece'
require_relative 'slideable'


class Rook < Piece
  include Slideable

  def initialize(pos, board, symbol)
    super
  end

  def symbol
    @color
  end

  def move_dirs
    horizontal_dirs
  end

end

# b = Board.new
# rook = Rook.new([0, 0], b, :white)
# p rook.moves
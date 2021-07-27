require 'singleton'
class Piece
  attr_accessor :pos, :symbol

  def initialize(pos, board, symbol)
    @color = symbol
    @pos = pos
    @board = board
  end

  def inspect
    print "Piece "
  end

  def valid_moves(start_pos)
    moves = []

  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def inspect
    print "NullPiece "
  end
end
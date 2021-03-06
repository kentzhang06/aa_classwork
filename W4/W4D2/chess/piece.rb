require 'singleton'
require_relative 'board'

class Piece
  attr_accessor :pos, :symbol
  attr_reader :board, :color

  def initialize(pos, board, symbol= :white)
    @color = symbol
    @pos = pos
    @board = board
  end

  def on_board?(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 && col < 8
  end

  def inspect
    print "Piece "
  end

  def to_s

  end

  def empty?

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
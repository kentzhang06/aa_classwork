require_relative 'piece'
require_relative 'slideable'


class Queen < Piece
  include Slideable

  def initialize(pos, board, symbol)
    super
  end

  def symbol
    @color
  end

end
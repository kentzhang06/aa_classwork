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
  
  # protected
  # def move_dirs
  # #   # row, col = @pos
  # #   # dirs = [[row + 1, col], [row, col + 1], [row - 1, col], [row, col - 1]]
  # #   # res = []
  # #   # dirs.each_with_index do |dir, i|
  # #   #   unless (dir[0] < 0 || dir[0] > 7) || (dir[1] < 0 || dir[1] > 7)
  # #   #     || @board[dir].color == self.color
  # #   #     res << compass[i]
  # #   #   end
  # #   # end
  # #   # res
  # end

end

b = Board.new
rook = Rook.new([0, 0], b, :white)
p rook.move_dirs
require_relative 'piece'

class Rook < Piece
  def initialize
    super
  end

  def symbol
    @color
  end
  
  private
  def move_dirs
    row, col = @pos
    dirs = [[row + 1, col], [row, col + 1], [row - 1, col], [row, col - 1]]
    compass = ['S','E','N','W']
    res = []
    dirs.each_with_index do |dir, i|
      unless (dir[0] < 0 || dir[0] > 7) || (dir[1] < 0 || dir[1] > 7)
        || @board[dir].color == self.color
        res << compass[i]
      end
    end
    res
  end

end
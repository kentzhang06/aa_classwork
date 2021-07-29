require_relative 'piece'
require_relative 'slideable'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) } #rows 0 1 6 7 have pieces
    rows_white = [0, 1]
    rows_black = [6, 7]
    @grid.each_with_index do |row, i|
      if (rows_white + rows_black).include?(i)
        (0..7).each do |j|
          color = rows_white.include?(i) ? :white : :black
          @grid[i][j] = Piece.new([i, j], self, color)
        end
      else
        (0..7).each { |j| @grid[i][j] = NullPiece.instance}
      end
    end
  end

  def inspect
    puts "#{Board.object_id}"
    puts "#{@grid}"
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position." if self[start_pos].is_a?(NullPiece)
    #raise "Piece cannot move to end position."  if valid_move && pos_on_board
    if self[end_pos].is_a?(NullPiece)
      swap(start_pos, end_pos)
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end
  end

  def swap(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

end

# b = Board.new
# p b


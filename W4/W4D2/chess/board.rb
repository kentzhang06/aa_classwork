require_relative 'piece'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) } #rows 0 1 6 7 have pieces
    rows_to_include = [0, 1, 6, 7]
    @grid.each_with_index do |row, i|
      if rows_to_include.include?(i)
        row.each_with_index do |el, j|
          @grid[i][j] = Piece.new([i, j], self)
        end
      else
        row.each_with_index do |el, j|
          @grid[i][j] = NullPiece.instance
        end
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


require_relative 'piece'

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) } #rows 0 1 6 7 have pieces
    rows_to_include = [0, 1, 6, 7]
    @grid.each_with_index do |row, i|
      if rows_to_include.include?(i)
        row.each_with_index do |el, j|
          @grid[i][j] = Piece.new
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

end

b = Board.new
p b
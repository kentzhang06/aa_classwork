class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    def valid?(position) #position = [row, col]
        row = position[0]
        col = position[1]

        if (row >= 0 && row < @grid.length) && (col >= 0 && col < @grid.length)
            return true
        end

        return false
    end

    def empty?(position)
        row = position[0]
        col = position[1]

        @grid[row][col] == '_'
    end

    def place_mark(position, mark)
        if !self.valid?(position)
            raise 'position out of bounds'
        elsif !self.empty?(position)
            raise 'position taken'
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all? { |ele| ele == mark }
                return true
            end
        end

        false
    end

    def win_col?(mark)
        (0...@grid.length).each do |col|
            array_col = []
            (0...@grid.length).each do |row|
                array_col << @grid[row][col]
            end
            return true if array_col.all? { |ele| ele == mark}
        end
        return false
    end

    def win_diagonal?(mark)
        array_diag1 = []
        array_diag2 = []
        (0...@grid.length).each do |i|
            array_diag1 << @grid[i][i]
        end

        col = @grid.length - 1
        (0...@grid.length).each do |row|
            array_diag2 << @grid[row][col]
            col -= 1
        end

        if array_diag1.all?{ |ele| ele == mark} || array_diag2.all?{ |ele| ele == mark}
            return true
        end

        false

    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        end

        false
    end

    def empty_positions?
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                return true if self.empty?([row, col])
            end
        end

        false
    end

    def legal_positions
        positions_arr = []
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                positions_arr << [row, col] if self.empty?([row, col])
            end
        end
        positions_arr
    end

end

# new_board = Board.new(4)
# p new_board

#test valid?
# p new_board.valid?([2, 0]) #true
# p new_board.valid?([10, 3]) #false

#test empty?
# p new_board.empty?([0, 0])

#test place_mark
# new_board.place_mark([0,0], :O)
# p new_board
# new_board.place_mark([0,2], :O)
# new_board.place_mark([1,1], :O)
# new_board.place_mark([2,0], :O)
# new_board.place_mark([0,0], :X)
# # new_board.place_mark([0,1], :X)
# new_board.place_mark([0,2], :X)
# new_board.place_mark([1,0], :X)
# new_board.place_mark([1,1], :X)
# new_board.place_mark([1,2], :X)
# new_board.place_mark([2,0], :X)
# new_board.place_mark([2,1], :X)
# new_board.place_mark([2,2], :X)
# new_board.print
# new_board.print
# # p new_board.win?(:X)
# p new_board.empty_positions?
# p new_board.legal_positions




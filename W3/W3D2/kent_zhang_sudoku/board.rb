require_relative "tile.rb"

class Board

    def initialize
        @grid = Board.from_file
    end

    def self.from_file
        text = File.readlines("text.txt")
        new_array = Array.new(9) { Array.new(9)}
        row = 0
        File.readlines("text.txt").each do |line|
            line.chomp.each_char.with_index do |char, i|
                new_array[row][i] = Tile.new(char)
            end
           row += 1
        end
        
        new_array
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col].to_s
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = Tile.new(value).to_s
    end

    def valid_position?(pos)
        return true if self[pos].to_i == 0
        false
    end

    def render
        @grid.each do |row|
            row.each do |tile|
                print "#{tile.to_s} "
            end
            print "\n"
        end
    end

    def row_solved?
        @grid.each do |row|
            tot_sum = 0
            row.each do |tile|
                tot_sum += tile.value.to_i
            end
            return false if tot_sum != 45
        end
        true
    end

    def col_solved?
        @grid.transpose.each do |col|
            tot_sum = 0
            col.each do |tile|
                tot_sum += tile.value.to_i
            end
            return false if tot_sum != 45
        end
        true
    end

    # (0, 2) (0, 2)          (0,2) (3,5)         (0,2) (6,8)
    # (3, 5) (0, 2)          (3,5) (3,5)         (3,5) (6,8)
    # (6, 8) (0, 2)          (6,8) (3,5)         (6,8) (6,8)
    # [0,0] [0,1] [0,2] - [0,3] [0,4] [0,5]
    # [1,0] [1,1] [1,2] - [1,3] [1,4] [1,5]
    # [2,0] [2,1] [2,2] - [2,3] [2,4] [2,5]


    def section_solved?

        r = [[0, 2], [3, 5], [6, 8]]

        (0..2).each do |x|
           i = 0
           3.times do
              return false if !single_section(r[x][0], r[x][1], r[i][0], r[i][1])
              i += 1
           end
        end
        true

        # total_sum = 0
        # (0..2).each do |row|
        #     (0..2).each do |col|
        #         total_sum += @grid[row][col].value.to_i
        #     end
        # end
        # total_sum == 45


    end

    def single_section(row1_start, row2_end, col1_start, col2_end)
        total_sum = 0
        (row1_start..row2_end).each do |row|
            (col1_start..col2_end).each do |col|
                total_sum += @grid[row][col].value.to_i
            end
        end
        total_sum == 45
    end

    def solved?
        section_solved? && row_solved? && col_solved?
    end


end

b = Board.new
pos = 0,0
p b[pos] = 4
#b.render
# p b.solved?


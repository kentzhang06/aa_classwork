class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](array) #[row, column] = position
        @grid[array[0]][array[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count_s = 0
        @grid.flatten.each { |ele| count_s += 1 if ele == :S}
        count_s
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        tot_ships = @size/4
        
        while self.num_ships < tot_ships
            r_row = rand(0...@grid.length)
            r_col = rand(0...@grid.length)
            pos = [r_row, r_col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |s|
            s.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end

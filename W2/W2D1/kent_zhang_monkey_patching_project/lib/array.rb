# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?

        if self.all? { |i| i.is_a?(Integer) }
            self.max - self.min
        end
    end

    def average
        return nil if self.empty?

        self.sum/(self.length*1.0)

    end

    def median
        return nil if self.empty?

        if self.length%2 != 0
            self.sort[self.length/2]
        else
            sorted = self.sort
            (sorted[self.length/2] + sorted[self.length/2 - 1])/2.0
        end
    end

    def counts
        h = Hash.new(0)

        self.each { |x| h[x] += 1 }

        h
    end

    def my_count(num)
        count = 0
        self.each { |x| count += 1 if x == num}
        count
    end

    def my_index(num)
        return nil if !self.include?(num)

        self.each_with_index { |x, i| return i if num == x }
    end

    def my_uniq
        new_arr = []
        self.each { |x| new_arr << x if !new_arr.include?(x)}

        new_arr
    end

    def my_transpose
        len = self[0].length
        new_arr = Array.new(len) {Array.new(len)}

        self.each_with_index do |r, i|
            self.each_with_index do |c, j|
                new_arr[i][j] = self[j][i]
            end
        end

        new_arr
    end
end

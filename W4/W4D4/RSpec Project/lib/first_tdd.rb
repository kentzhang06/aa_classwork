class Array
  def uniq
    result = []

    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    indices = []
    self.each_with_index do |n1, idx1|
      self.each_with_index do |n2, idx2|
        indices << [idx1, idx2] if idx1 < idx2 && (n1 + n2 == 0)
      end
    end
    indices
  end

  def transpose
    transposed = []

    (0...self.length).each do |col|
      temp = []
      (0...self.length).each do |row|
        temp << self[row][col]
      end

      transposed << temp
    end
    
    transposed
  end

  def stock_picker
    highest_profit = 0
    best_pair = nil
    self.each_with_index do |price1,idx1|
      self.each_with_index do |price2, idx2|
        if idx1 < idx2
          profit = price2 - price1
        else
          next
        end
        best_pair = [idx1, idx2] if profit > highest_profit
      end
    end
    best_pair
  end
end
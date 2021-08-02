class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = []
  end

  def insert(num)
    if num > @max || num < 0
      raise 'Out of bounds'
    end
    @store[num] = true
  end

  def remove(num)
    @store.delete(@store[num])
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
     self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
      if !include?(num)
        self[num] << num
        @count += 1 
      end
  end

  def remove(num)
  end

  def include?(num)
    self[num].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
   @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets + 1
    new_array = Array.new()
    
  end
end

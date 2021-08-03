class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key] << key
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    h = num.hash
    @store[h % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets*2) {Array.new}
    @store.flatten.each do |key|
      new_arr[key.hash % (num_buckets*2)] << key
    end
    @store = new_arr
  end
end

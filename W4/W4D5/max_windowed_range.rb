# current_max_range = nil
# def windowed_max_range(arr, w)
#   windows = []
#   arr.each_with_index do |ele, i|
#     break if i+w > arr.length
#     windows << arr[i...i+w]
#   end
  
  
#   diffs = []
#   windows.each do |window|
#     diffs << window.max - window.min
#   end
#   return diffs.max
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(ele)
    @store.push(ele)
    nil
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @store.max
  end

  def min
    @store.min
  end
end

def windowed_max_range(arr, w)
  copy = arr.dup
  q = MyQueue.new

  w.times do
    temp = copy.shift
    q.enqueue(temp)
  end

  min = q.min
  max = q.max

  biggest_diff = max - min

  until copy.empty?
    temp = copy.shift
    max = temp if temp > max
    min = temp if temp < min

    q.dequeue
    q.enqueue(temp)
    diff = max - min
    biggest_diff = diff if diff > biggest_diff
  end
  
  biggest_diff
  
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


# current_max_range = nil
def windowed_max_range(arr, w)
  windows = []
  arr.each_with_index do |ele, i|
    break if i+w > arr.length
    windows << arr[i...i+w]
  end
  
  
  diffs = []
  windows.each do |window|
    diffs << window.max - window.min
  end
  return diffs.max
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


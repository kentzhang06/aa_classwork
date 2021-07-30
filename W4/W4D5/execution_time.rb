#Execution Time Difference

#Phase1
def my_min(arr) #O(n^2)
  min = arr[0]
  arr.each do |el1|
    arr.each do |el2|
      min = el2 if el2 <= min
    end
  end
  min
end

#Phase2
def my_min(arr) #O(n)
  min = arr[0]
  arr[1..-1].each do |el|
    min = el if el < min
  end
  min
end

#Largest Contiguous Sub-sum
#Phase1
def largest_contiguous_subsum(list) #O(n^2)
  subs = []
  list.each_index do |i|
    (i...list.length).each do |j|
      subs << list[i..j]
    end
  end
  max = subs[0].sum
  subs.each do |sub|
    max = sub.sum if sub.sum >= max
  end
  max
end

#Phase2 #O(n)
def largest_contiguous_subsum(list) 
  largest_sum = -99999
  current_sum = 0

  list.each do |el|
    el > current_sum ? current_sum = el : current_sum += el

    largest_sum = current_sum  if current_sum > largest_sum
  end
  largest_sum
end




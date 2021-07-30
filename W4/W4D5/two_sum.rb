#brute force
def bad_two_sum?(arr, target_sum) #O(n^2)
  # your code here...
  arr.each_with_index do |el, i|
    (i+1...arr.length).each do |j|
      return true if el + arr[j] == target_sum
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  bad_two_sum?(sorted, target_sum)
end

def two_sum?(arr, target_sum) #O(n)
  hash = Hash.new { |h,k| h[k] = [] }
  arr.each_with_index { |el, idx| hash[el] << idx }

  hash.each do |k, v|
    diff = target_sum - k
    if diff == k
      return true if hash[diff].length > 1
    else
      return true if hash.has_key?(diff)
    end
  end
  false
end




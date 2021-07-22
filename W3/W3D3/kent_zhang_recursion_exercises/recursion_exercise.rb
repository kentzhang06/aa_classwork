def range(start, last) 
  return [] if last <= start

  [start] + range(start + 1, last)
end

# p range(1, 5) # [1, 2, 3, 4]

def array_sum_iter(array)
  count = 0
  array.each { |el| count += el }
  count
end

def array_sum_rec(array)
  return array[0] if array.length <= 1
  
  array[0] + array_sum_rec(array[1..-1])
end

# p array_sum_rec([1, 2, 3, 4, 5])
# p array_sum_rec([3, 5, 6, 2, 19]) # 35
# p array_sum_rec([420, 69, 69, 420]) # 978

def exp(base, power)
  return 1 if power == 0
  
  base * exp(base, power - 1) 
end

def exp2(base, power) 
  return 1 if power == 0
  return base if power == 1
  
  if power.even?
    exp2(base, power / 2) ** 2
  else
    base * (exp2(base, (power - 1) / 2) ** 2)
  end
end

# p exp2(2, 7)

class Array
  def deep_dup
    return self if self.is_a?(Array)

    new_arr = []
    self.each do |ele|
        new_arr += ele.deep_dup
    end
    new_arr
  end
end

# p [1, [2], [3, [4]]].deep_dup

def fibonacci(n)
  return 0 if n == 1
  return 1 if n == 2

  fibonacci(n-1) + fibonacci(n-2)
end

# p fibonacci(3) # 1
# p fibonacci(4) # 2
# p fibonacci(5) # 3
# p fibonacci(6) # 5

def binary_search(array, target)
  return array.index(target) if target == array[array.length/2]
  return nil if array.length == 1 && target != array[array.length/2]

  mid_ele = array[array.length/2]
  first_half = array[0...array.length/2]
  second_half = array[array.length/2+1..-1]

  if target < mid_ele
    binary_search(first_half, target)
  else
    return nil if !binary_search(second_half, target)
    binary_search(second_half, target) + array.length/2+1
  end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length == 0 || arr.length == 1

  if arr.length.odd?
    first_half = arr[0..arr.length/2]
    second_half = arr[arr.length/2+1..-1]
  else
    first_half = arr[0...arr.length/2]
    second_half = arr[arr.length/2..-1]
  end
  merge(merge_sort(first_half), merge_sort(second_half))
end

def merge(sub1, sub2)
  result = []
  (0...sub1.length).each do |i|
    if sub1[i] == nil
      result << sub2[i]
    elsif sub2[i] == nil
      result << sub1[i]
    elsif sub1[i] < sub2[i]
      result << sub1[i] << sub2[i]
    else
      result << sub2[i] << sub1[i]
    end
  end

  if result[-1] < result[-2]
    result[-1], result[-2] = result[-2], result[-1]
  end

  result
end

# p merge_sort([]) # []
# p merge_sort([1]) # [1]
# p merge_sort([3, 4, 6, 1, 0, 5, 7, 2]) # [0, 1, 2, 3, 4, 6, 5, 7]
# p merge_sort([38, 27, 43, 3, 9, 82, 10]) # [3, 9, 10, 27, 38, 43, 82]

# sub1 = [27, 38]
# sub2 = [3, 43]
# p merge(sub1, sub2)
# sub1 = [9, 82]
# sub2 = [10]
# p merge(sub1, sub2)

def subsets(arr) # [1. 2] [1]
  return [[]] if arr.empty?
  old_subsets = subsets(arr[0..-2]) # [1] [[]]
  new_subsets = []
  p "old #{old_subsets}"
  old_subsets.each do |subset| # [[]]
    p "subset #{subset}"
    new_subsets << subset + [arr.last] # [] + [1]
    p "new #{new_subsets}"
  end
  
  old_subsets + new_subsets
end

# subsets([1, 2, 3])
# [[]] base case
# [[], [1]] result << [[], arr[0]] == subsets([]) + subsets([1])
# [[], [1], [2], [1, 2]] << [arr[0], arr[1]] + [arr[0], arr[1]] == subsets([1]) + subsets([2]) + subsets([arr[0], arr[1]])
# [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]] << [[], arr[0], arr[1], [arr[0], arr[1]]] + [arr[0], arr[1], arr[2]]

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([2]) # => [[], [2]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def factorial(n)
  return 1 if n <= 1

  n * factorial(n - 1)
end

def permutations(array)
  result = []

  return array if result.length == factorial(array.length)
  
  array.each do |ele|
    result += [ele] + permutations(array-[ele])
  end
  
  result
end

p permutations([1, 2, 3])

# p factorial(5) # 120
# p factorial(3) # 6
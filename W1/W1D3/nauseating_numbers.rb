def strange_sums(array) #arary = array of numbers
    count = 0
    #loop through all indices in array
    (0..array.length-1).each do |i|
        #at each number, loop through the rest of the loop starting at that index
        (i+1..array.length-1).each do |j|
            #increment count if pairs equal 0
            if array[i] + array[j] == 0
                count += 1
            end
        end
    end


    #return a count of number of distinct pairs of elements that have a sum of zero
    return count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(array, product)
    #loop through all indices in array
    (0..array.length-1).each do |i|
        #at each number, loop through the rest of the loop starting at that index
        (i+1..array.length-1).each do |j|
            #if pairs multiply to product, return true
            if array[i]*array[j] == product
                return true
            end
        end
    end

    #return a boolean indicating whether or not a pair of distinct elements in the array result in the product
    return false
end
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
    new_string = ""

    #loop through each character in the string
    string.each_char do |c|
        #check if c is a key in the hash,if true multiply character by value in hash, if not add original character
        if hash.has_key?(c)
            new_string += c * hash[c]
        else
            new_string += c
        end
    end


    #return a new string where characters of the original string are repeated the number of times specified by the hash
    return new_string
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square?(num)
    result = Math.sqrt(num)
    
    return result % 1 == 0

    #return a boolean indicating whether or not the argument is a perfect square
    
end

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

def anti_prime?(num)
    the_number_divisor = count_divisors(num)
    divisors = [the_number_divisor]

    (1...num).each do |n|
        divisors << count_divisors(n)
    end

    divisors.max == the_number_divisor

end

def count_divisors(num)
    count_divisors = 0

    (1..num).each do |n|
        count_divisors += 1 if num%n == 0
    end

    count_divisors
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(m1, m2)
    len = m1.length
    array = Array.new(len) {Array.new(m1[0].length)}

    (0...len).each do |r|
        (0...m1[0].length).each do |c|
            array[r][c] = m1[r][c] + m2[r][c]
        end
    end

    array
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    result = []
    mutual = true
    
    #find minimum num in nums argument
    arr_args = nums.map { |a| a}

    (1..arr_args.min).each do |factor|
        mutual = true
        nums.each do |n|
            mutual = false if n%factor != 0
        end

        result << factor if mutual
    end

    result

end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    result = 0
    arr = [1, 1, 2]

    while arr.length <= n
        arr << arr[arr.length-1] + arr[arr.length-2] + arr[arr.length-3]
    end

    arr[n-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


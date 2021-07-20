def proper_factors(num)
  
    (1...num).select {|n| n < num && num%n == 0 }
  
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    p_nums = []
    i = 1
    while i < 9999
        if perfect_number?(i)
            p_nums << i
            i += 1
        end

        if i == n
            return p_nums
        end
    end

    return p_nums
end
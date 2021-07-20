# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.



def largest_prime_factor(num)
    i = num - 1
    while i > 2
        if num%i == 0 && isprime?(i)
            return i
        end

        i -= 1
    end
    return num

end

def isprime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num%factor == 0
            return false
        end
    end
    return true
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char { |c| hash[c] += 1 }

    hash.each do |k, v|
        if v >= 2
            return false
        end
    end

    return true
end

def dupe_indices(array)
    hash = {}

    array.each do |c|
        arr_indices = find_dupe_indices(array, c)
        if arr_indices.length > 1
            hash[c] = arr_indices
        end
    end

    return hash

end

def find_dupe_indices(array, c)
    arr_of_indices = []

    array.each_with_index { |char, idx| arr_of_indices << idx if char == c}

    return arr_of_indices
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    arr_1.map { |ele| hash_1[ele] += 1}
    arr_2.map { |ele| hash_2[ele] += 1}

    if hash_1 == hash_2
        return true
    else
        return false
    end
end
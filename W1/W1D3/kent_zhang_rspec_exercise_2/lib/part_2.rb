def palindrome?(string)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    return true if string.length == 1
    

    if string.length % 2 == 0
        string[0...string.length/2].each_char { |c| hash_1[c] += 1}
        string[string.length/2..-1].each_char { |c| hash_2[c] += 1}
    else
        word_1 = string[0..string.length/2]
        word_2 = string[string.length/2..-1]
        word_1.each_char { |c| hash_1[c] += 1}
        word_2.each_char { |c| hash_2[c] += 1}

    end

    if hash_1 == hash_2
        return true
    end

    return false
end

def substrings(string)
    arr = []
    (0..string.length-1).each do |i|
        word = ""
        (i..string.length-1).each do |j|
            arr << word += string[j]
        end
    end

    return arr

end

def palindrome_substrings(string)
    new_arr = []
    arr_substrings = substrings(string)

    arr_substrings.each do |ele| 
        if palindrome?(ele) && ele.length > 1
            new_arr << ele
        end
    end

    return new_arr
end
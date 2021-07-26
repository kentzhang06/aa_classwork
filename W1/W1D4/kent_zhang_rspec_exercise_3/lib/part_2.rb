def element_count(array)
    hash = Hash.new(0)

    array.each { |ele| hash[ele] += 1}
    #return a hash where each key is an element of the array
    #and its corresponding value is the number of times it appears in the array
    return hash
end

def char_replace!(string, hash)
    #mutate original string by replacing chars of the string with
    #their corresponding values in the hash, if the char is a key of the hash
    string.each_char.with_index do |c, i|
        if hash.has_key?(c)
            string[i] = hash[c]
        end

    end


    #return mutated string
    return string
end

def product_inject(array)
    array.inject { |acc, el| acc * el}
    #return the total product of all elements multiplied together
    
end
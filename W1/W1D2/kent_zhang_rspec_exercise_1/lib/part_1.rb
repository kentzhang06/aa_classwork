def average(num_1, num_2)
    return (num_1 + num_2)/2.0
end

def average_array(array)
    return array.sum/(array.length*1.0)
end

def repeat(str, num)
    return str * num
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    words_arr = str.split
    new_word_arr = []
    uppercase = false

    words_arr.each do |word|
        if !uppercase
            new_word_arr << word.upcase
            uppercase = true
        else
            new_word_arr << word.downcase
            uppercase = false
        end
    end

    return new_word_arr.join(" ")
end
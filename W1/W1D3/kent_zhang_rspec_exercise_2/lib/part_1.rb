def partition(array, num)

    arr_1 = array.select { |ele| ele < num}

    arr_2 = array.select { |ele| ele >= num}

    return [arr_1, arr_2]

end

def merge(hash_1, hash_2)
    hash = {}

    hash_1.each { |k, v| hash[k] = v }
    hash_2.each { |k, v| hash[k] = v}

    hash
end

def censor(sentence, array)
    words = sentence.split
    new_words = []

    words.each do |word|
        if array.include?(word.downcase)
            new_words << censor_helper(word)
        else
            new_words << word
        end
    end

    return new_words.join(" ")
end

def censor_helper(word)
    vowels = "aeiou"
    new_str = ""

    word.each_char do |c|
        if vowels.include?(c.downcase)
            new_str += "*"
        else
            new_str += c
        end
    end

    return new_str
end

def power_of_two?(num)
    count = 1
    if num == 1
        return true
    end

    while count <= num
        count = count * 2
        if count == num
            return true
        end
    end

    return false

end

def select_even_nums(array)
    return array.select(&:even?)
end

def reject_puppies(arr_dog)
    return arr_dog.reject {|dog_hash| dog_hash["age"] <= 2}
end

def count_positive_subarrays(arr_2d)
    return arr_2d.count { |arr| arr.sum > 0}
end

def aba_translate(string)
    new_str = ""
    vowels = "aeiou"

    string.each_char do |c|
        if vowels.include?(c)
            new_str += c + "b" + c
        else
            new_str += c
        end
    end

    return new_str
end

def aba_array(array)
    return array.map {|word| aba_translate(word)}
end
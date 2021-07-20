def zip(*arrays)
    result = Array.new(arrays[0].length) {Array.new(arrays.length)}
    arrays.each_with_index do |arr, i|
        arr.each_with_index do |ele, j|
            result[j][i] = ele
        end
    end

    result
end

def prizz_proc(array, prc1, prc2)
    array.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
    #return new array containing elements that return true for exactly one proc

end

def zany_zip(*arrays)
    lengths = []
    arrays.each { |arr| lengths << arr.length}
    result = Array.new(lengths.max) {Array.new(arrays.length)}

    arrays.each_with_index do |arr, i|
        arr.each_with_index do |ele, j|
            result[j][i] = ele
        end
    end

    result

end

def maximum(array, &prc)
    max = 0
    max_index = 0
    return nil if array.empty?

    new_arr = array.map { |ele| prc.call(ele)}

    new_arr.each_with_index do |ele, i|
        if ele >= max
            max = ele
            max_index = i
        end
    end

    array[max_index]

end

def my_group_by(array, &prc)
    hash = Hash.new { |h, k| h[k] = []}
    array.each do |ele| 
        hash[prc.call(ele)] << ele
    end
    #return a hash where keys are the results when the elements are given to the block
    hash
end

def max_tie_breaker(array, prc, &blk)
    max = 0
    max_index = 0

    array.each_with_index do |ele, i|
        if blk.call(ele) > max
            max = blk.call(ele)
            max_index = i
        end
    end

    ties = array.select { |ele| blk.call(ele) == max}

    if ties.length > 1
        max = 0
        ties.each_with_index do |ele, i|
            return ele if prc.call(ele)
        end
    end

    array[max_index]

end

def silly_syllables(sentence)
    words = sentence.split

    new_words = words.map { |word| remove_letters_before_after_vowels(word) }

    new_words.join(" ")
end

def remove_letters_before_after_vowels(word)
    count = 0
    vowels = "aeiou"
    indices = []

    word.each_char { |c| count += 1 if vowels.include?(c)}

    return word if count < 2

    word.each_char.with_index do |c, i|
        indices << i if vowels.include?(c)
    end

    first_index = indices[0]
    last_index = indices[-1]

    word[first_index..last_index]
end
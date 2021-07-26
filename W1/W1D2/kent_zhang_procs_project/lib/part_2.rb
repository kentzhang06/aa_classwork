def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    sentence_array = []
    words = string.split

    words.each { |word| sentence_array << prc.call(word) }

    sentence_array.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    [prc1.call(num), prc2.call(num)].max

end

def and_selector(array, prc1, prc2)
    array.select { |ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper(array, prc1, prc2)
    new_array = []
    array.each_with_index do |ele, i|
        if i%2 == 0
            new_array << prc1.call(ele)
        else
            new_array << prc2.call(ele)
        end
    end

    return new_array
end
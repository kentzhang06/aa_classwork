def duos(string)
    consec = 0

    string.each_char.with_index do |c, i|
        if string[i] == string[i+1]
            consec += 1
        end
    end

    consec
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split
    new_words = []

    words.each do |w|
        if hash.has_key?(w)
            new_words << hash[w]
        else
            new_words << w
        end
    end

    new_words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blk)
    new_hash = {}
    hash.each do |k, v|
        new_hash[blk.call(k)] = prc.call(v)
    end
    #return new hash where each key is a result of original key when given to the block
    #each value of new hash should result of original values passed in proc
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(string)
    hash = Hash.new(0)
    new_arr = []

    string.each_char { |c| hash[c] += 1}

    hash.each do |k,v|
        new_arr << k if v > 2
    end
    #return an array containing characters of the string that appear more than twice
    new_arr
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true?(string)

    string.each_char.with_index do |c, i|
        return true if string[i] == string[i+1] && string[i+1] == string[i+2]

    end

    false

    #returns a boolean
    #whether or not string contains three of the same character consecutively
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

def energetic_encoding(string, hash)
    new_str = ""

    string.each_char do |c|
        if c == ' '
            new_str += ' '
        elsif hash.has_key?(c)
            new_str += hash[c]
        else
            new_str += '?'
        end
    end
    #return new string, characters of the orig string are replaced with corresponding hash values
    #if not a key -> '?'
    #if ' ' unchanged
    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    numbers = "1234567890"
    new_str = ""

    string.each_char.with_index do |c, i|
        if numbers.include?(c)
            new_str += string[i-1] * Integer(c)
        end
    end
    #every letter is followed by a num
    #return "uncompressed" version of the string, every letter is repeated multiple times based on number
    new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(array, *prcs)
    new_arr = []
    all_true = true

    array.each do |ele|
        all_true = true
        prcs.each do |p|
            all_true = false if !p.call(ele)
        end
        new_arr << ele if all_true
    end
    #return new array
    #with elements that return true when pased into all procs
    new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    new_sentence = []
    vowels = "aeiou"
    words = sentence.split

    words.each do |w|
        if w.length < 3
            new_sentence << w
        else
            if vowels.include?(w[0].downcase)
                new_sentence << w + "yay"
            else
                new_sentence << non_vowel(w) + "ay"
            end
        end
    end
    #words that are shorter than 3 char = unchanged
    #words that are 3 characters or longer are translated: if word begins with vowel, add 'yay' to end of the word
    #if word begins with non vowel, move all letters that come before the word's first vowel to end of the word and add 'ay'
    new_sentence[0] = new_sentence[0].capitalize
    new_sentence.join(" ")
end

def non_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index do |c, i|
        return word[i..-1] + word[0...i] if vowels.include?(c)
    end

    word
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    new_words = []
    vowels = "aeiou"
    words = sentence.split

    words.each do |w|
        if w.length < 3
            new_words << w
        else
            if vowels.include?(w[-1].downcase)
                new_words << w * 2
            else
                new_words << reverberate_nonvowel(w)
            end
        end
    end
    #words shorter than 3 unchanged
    #words 3 or longer: if word ends with vowel, repeat the word twice
    #if word ends with non-vowel, repeat all letters that come after the word's last vowel, including the last vowel

    new_words.join(" ")

end

def reverberate_nonvowel(word)
    vowels = "aeiou"

    i= word.length - 1

    while i >= 0
        return word + word[i..-1] if vowels.include?(word[i])
        i -= 1
    end

    word
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *prc)
    new_array = []
    at_least = false

    array.each do |ele|
        at_least = false
        prc.each do |p|
            at_least = true if p.call(ele)
        end

        new_array << ele if at_least
    end
    #return new array
    #containing elements that return true when passed in at least one of the procs
    new_array
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
    new_words = []
    words = sentence.split
    first_vowel = true

    words.each do |w|
        if first_vowel
            new_words << remove_first(w)
            first_vowel = false
        else
            new_words << remove_last(w)
            first_vowel = true
        end
    end
    #return new sentence, words alternate between having their first or last vowel removed
    new_words.join(" ")
end

def remove_first(word)
    vowels = "aeiou"

    word.each_char.with_index do |c, i|
        if vowels.include?(c)
            return word[0...i] + word[i+1..-1]
        end
    end

    word
end

def remove_last(word)
    vowels = "aeiou"

    i = word.length - 1
    while i >= 0
        return word[0...i] + word[i+1..-1] if vowels.include?(word[i])
        i -= 1
    end

    word
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    new_words = []
    vowels = "aeiou"
    words = sentence.split

    words.each do |w|
        if vowels.include?(w[-1])
            new_words << w + w[-1]
        else
            new_words << silly_helper(w)
        end
    end
    #ends with vowel, repeat that vowel at the end of the word
    #ends with non vowel, every vowel of the word should follow by 'b' and that same vowel
    new_words.join(" ")
end

def silly_helper(word)
    new_word = ""
    vowels = "aeiou"

    word.each_char do |c|
        if vowels.include?(c)
            new_word << c + 'b' + c
        else
            new_word << c
        end
    end

    new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    new_str = ""
    consec = 1

    string.each_char.with_index do |c,i|
        if string[i] == string[i+1]
            consec += 1
        elsif string[i] != string[i+1] && consec > 1
            new_str << c + String(consec)
            consec = 1
        else
            new_str << c
        end
    end

    new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
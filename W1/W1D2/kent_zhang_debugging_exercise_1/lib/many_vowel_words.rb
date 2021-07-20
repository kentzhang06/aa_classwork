# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, many_vowel_words, that accepts a sentence string as an arg. 
# The method should return a new sentence containing only the words that contain two or more vowels.

#require "byebug"

def many_vowel_words(sentence)
    #debugger
    words = sentence.split

    new_words = words.select do |word|
        vowel_count = num_vowels(word)
        vowel_count >= 2
    end

    new_words.join(" ")
end

def num_vowels(word)
    count = 0
    vowels = "aeiou"
    word.each_char do |c|
        count += 1 if vowels.include?(c.downcase)
    end
    return count
end

#many_vowel_words("Hello world, how are you") #=> Hello are you
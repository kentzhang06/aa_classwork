# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    result = []
    #iterate through all words
    words.each_with_index do |word, i|
        h1 = vowels_hash(word)
        (i+1...words.length).each do |j|
            h2 = vowels_hash(words[j])
            h3 = h1.merge(h2)
            result << [word, words[j]].join(" ") if all_vowels(h3)
        end
    end

    result
end

def vowels_hash(word)
    vowels = "aeiou"
    hash = Hash.new(0)
    word.each_char { |c| hash[c] += 1 if vowels.include?(c) }
    hash
end

def all_vowels(hash)

    vowels = "aeiou"
    vowels.each_char do |v|
        return false if !hash.has_key?(v)
    end
    true
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each { |d| return true if num%d == 0}
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    result_bigrams = []
    words = str.split
    #iterate through str
    words.each do |word|
        (0...word.length-1).each do |i|
            result_bigrams << word[i] + word[i+1] if bigrams.include?(word[i] + word[i+1])
        end
    end
    #iterate through bigrams

    (bigrams.map { |b| b if result_bigrams.include?(b) }).compact
end


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        result = {}
        if prc
            self.each do |k, v|
                result[k] = v if prc.call(k, v)
            end
        else
            self.each do |k, v|
                result[k] = v if k == v
            end
        end

        result
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        #create all substrings
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                subs << self[i..j]
            end
        end

        subs = subs.select { |s| s.length == length} if length

        subs
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        result = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        self.each_char do |c|
            result += alphabet[(alphabet.index(c) + num)%26]
        end
        result
    end
end

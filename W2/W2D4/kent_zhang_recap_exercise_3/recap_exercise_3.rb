def no_dupes?(arr)
    hash = Hash.new(0)

    arr.each { |ele| hash[ele] += 1}

    hash.select { |k,v| k if v == 1}.keys

    
end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h,k| h[k] = [] }
    str.each_char.with_index { |ele, i| hash[ele] << i }

    hash
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    longest = 0
    longest_str = ""
    current_long = 0

    return str if str.length == 1

    (0..str.length-1).each do |i|
        if str[i] == str[i+1]
            current_long += 1 
        elsif str[i] != str[i+1]
            if current_long >= longest
                longest = current_long
                longest_str = str[str.index(str[i])..i]
            end
            current_long = 0
        end
    end
    longest_str
end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    arr_primes = (2..num/2).select { |n| n if is_prime?(n) }

    (0..arr_primes.length-1).each do |i|
        (i..arr_primes.length-1).each do |j|
            return true if arr_primes[i] * arr_primes[j] == num
        end
    end

    false
end

def is_prime?(n)
    (2...n).each do |div|
        return false if n%div == 0 
    end
    true
end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    result = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    key_idx = 0
    message.each_char.with_index do |c, i|
        result << alphabet[(alphabet.index(c) + keys[key_idx])%26]
        key_idx += 1
        key_idx = 0 if key_idx == keys.length
    end

    result
end

# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    prev_vowel = ''
    str.each_char.with_index do |c, i|
        if vowels.include?(c)
            if prev_vowel == ''
                str[i] = str[last_vowel_idx(str)]
            else
                str[i] = prev_vowel
            end

            prev_vowel = c
        end
    end
    str
end

def last_vowel_idx(str)
    vowels = "aeiou"

    i = str.length - 1
    while i >= 0
        return i if vowels.include?(str[i])
        i -= 1
    end

    return 0
end

# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        result = ""

        return "" if !prc

        self.each_char do |c|
            result += c if prc.call(c)
        end

        result
    end

    def map!(&prc)
        self.each_char.with_index do |c,i|
            self[i] = prc.call(c)
        end
    end
end

# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    if b == 1
        return a
    end

    if b < 0
        -(a + multiply(a, -b-1))
    else
        a + multiply(a, b-1)
    end
end

# # Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2

    arr = lucas_sequence(num-1)
    next_seq = arr[-1] + arr[-2]
    arr << next_seq
    arr
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    
    (2...num).each do |f|
        if num%f == 0
            return prime_factorization(f).concat(prime_factorization(num/f))
        end
    end

    [num]

end

# # Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]


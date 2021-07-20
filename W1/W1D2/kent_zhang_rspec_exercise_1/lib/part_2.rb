def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1

    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end

    return word
end

def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)

    str.each_char do |c|
        if vowels.include?(c.downcase)
            hash[c.downcase] += 1
        end
    end

    return hash
end

def caesar_cipher(message, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""

    message.each_char do |c|
        if alphabet.include?(c)
            old_idx = alphabet.index(c)
            new_idx = (old_idx + n)%26

            new_str << alphabet[new_idx]
        else
            new_str << c
        end
    end

    return new_str
end
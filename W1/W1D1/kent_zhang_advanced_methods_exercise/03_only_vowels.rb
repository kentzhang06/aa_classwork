# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    #create vowel str
    vowels = "aeiou"
    #iterate through each char of string
    str.each_char do |c|
        if !vowels.include?(c) #if char is not a vowel, return false
            return false
        end
    end

    return true

end


p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false



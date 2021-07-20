# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    consecutive = 1

    #iterate through each char of string
    str.each_char.with_index do |c, idx|
        if str[idx] == str[idx+1] #if next char is the same, increment consecutive
            consecutive += 1
        elsif consecutive > 1 && str[idx] != str[idx+1] #if next char is not equal, and consecutive greater than 1, add consecutive count and char to new_str
            new_str += consecutive.to_s + c
            consecutive = 1
        else #if no consecutive and next char is not equal, just add char
            new_str += c
        end
    end

    return new_str #return new_str
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"

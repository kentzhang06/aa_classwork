def first_anagram?(str_1, str_2) # O(n!)
  anagrams = str_1.split("").permutation.to_a
  words = anagrams.map { |ele| ele.join("")}
  words.include?(str_2)
end

# p first_anagram?("word", "bank")
# p first_anagram?("elvis", "lives")

#phase 2

def second_anagram?(str_1, str_2) # O(n^2)
  array = str_2.split("")
  str_1.each_char do |char|
    target = array.find_index(char)
    return false if target.nil?
    array.delete_at(target)
  end
  return true if array.empty?
end

# p second_anagram?("elvis", "lives")
# p second_anagram?("word", "bank")

def third_anagram?(str_1, str_2) #O(n*log(n)) worst case n^2
  str_1.split("").sort == str_2.split("").sort
end

# p third_anagram?("word", "bank")

def fourth_anagram?(str_1, str_2) # O(n)
  return false if str_1.length != str_2.length
  count = Hash.new(0)
  
  (0...str_1.length).each do |i|
    count[str_1[i]] += 1
    count[str_2[i]] -= 1
  end
  
  count.all? { |k, v| v == 0 }
end

# p fourth_anagram?("word", "bank")
# p fourth_anagram?("elvis", "lives")
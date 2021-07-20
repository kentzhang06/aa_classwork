def all_words_capitalized?(array)
    array.all? {|word| word == (word[0].upcase + word[1..-1].downcase)}
end

def no_valid_url?(array)
    urls = [".com", ".net", ".io", ".org"]
    array.none? { |u| urls.include?(u[u.index('.')...u.length]) }
end

def any_passing_students?(array)
    array.any? { |hash| (hash[:grades].sum)/(hash[:grades].length * 1.0) >= 75}
end
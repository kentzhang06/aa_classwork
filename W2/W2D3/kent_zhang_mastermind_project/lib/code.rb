#require "byebug"
class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(array_chars)
    array_chars.all? { |c| POSSIBLE_PEGS.has_key?(c.upcase) }
  end

  def initialize(array_chars)
    if !Code.valid_pegs?(array_chars)
      raise 'invalid pegs'
    else
      @pegs = array_chars.map { |c| c.upcase }
    end
  end

  def self.random(length)
    new_array = []
    length.times { new_array << POSSIBLE_PEGS.keys.sample }
    Code.new(new_array)
  end

  def self.from_string(string)
    new_array = []
    string.each_char { |c| new_array << c }
    Code.new(new_array)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if guess[i] == self[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    correct_index = []
    new_arr = []
    (0...guess.length).each do |i|
      if guess[i] == self[i]
        correct_index << i
      else
        new_arr << self[i]
      end
    end


    (0...guess.length).each do |j|
      if guess[j] != self[j] && !correct_index.include?(j) && new_arr.include?(guess[j])
        new_arr.delete_at(new_arr.index(guess[j]))
        count += 1
      end
    end

    count

  end

  def ==(code)
    return false if code.length != self.length

    (0..code.length).each do |i|
      return false if code[i] != self[i]
    end

    return true

  end


end


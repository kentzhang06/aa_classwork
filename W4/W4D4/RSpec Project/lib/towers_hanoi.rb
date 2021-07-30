require "pp"

class TowersHanoi
  attr_accessor :num_discs, :stacks, :stack1

  def initialize(num_discs)
    @num_discs = num_discs
    @stack1 = (1..num_discs).to_a.reverse
    @stacks = [ stack1, [], [] ]
  end

  def play
    won?
    move(*get_input)
  end

  def won?
    stacks[-1] == (1..num_discs).to_a.reverse
  end

  def move(from, destination)
    raise "Can't move a disc from an empty stack" if stacks[from].empty?
    raise "Can't a move a larger disc on top of a smaller one" if !stacks[destination].empty? && (stacks[from].last > stacks[destination].last)
    stacks[destination] << stacks[from].pop
  end

  def get_input
    puts "Enter the stack you would like to move from, and its destination stack"
    move = gets.chomp.split.map(&:to_i)
  end

end

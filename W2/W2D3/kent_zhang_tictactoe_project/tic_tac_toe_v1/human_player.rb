
class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Player " + @mark.to_s + ", enter two numbers representing a position in the format 'row col'"
        position = gets.chomp

        if position.length < 3
            raise 'too little numbers'
        elsif position.length > 3
            raise 'too many spaces or numbers'
        end

        inputs = position.split
        raise 'please enter integer' if !is_integer?(inputs[0]) || !is_integer?(inputs[1])
        inputs.map { |ele| ele.to_i }


    end

    def is_integer?(num)
        true if Integer(num) rescue false
    end
end

# p1 = HumanPlayer.new(:S)
# p p1.mark
# p p1.get_position
# p p1.is_integer?('a')
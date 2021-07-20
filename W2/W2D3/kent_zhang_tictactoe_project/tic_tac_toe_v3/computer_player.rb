class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        print "Player " + @mark.to_s + ", enter two numbers representing a position in the format 'row col'"
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

    def get_position(legal_positions)
        random_index = rand(0...legal_positions.length)
        puts "Computer #{self.mark} chose position #{legal_positions[random_index]}"
        legal_positions[random_index]
    end
end


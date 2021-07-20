require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        print code.num_exact_matches(@secret_code)
        print code.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        print 'Enter a code'
        input = gets.chomp
        code = Code.from_string(input)
        print code.num_exact_matches(@secret_code)
        print code.num_near_matches(@secret_code)
        code==@secret_code
    end
end

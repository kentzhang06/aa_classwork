class Item
    def self.valid_date?(date_string)
        str_arr = date_string.split('-')

        #year YYYY
        if (str_arr[0].length <=> 4) != 0
            return false
        end
        #month MM
        if str_arr[1].length > 2 || str_arr[1].length < 1
            return false
        else
            month = str_arr[1].to_i
            return false if month > 12 || month < 1
        end
        #date DD
        if str_arr[2].length > 2 || str_arr[2].length < 1
            return false
        else
            date = str_arr[2].to_i
            return false if date > 31 || date < 1
        end

        true
    end

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        @done = false
        @title = title
        @description = description
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise 'deadline is invalid'
        end
    end

    def toggle
        @done = !@done
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise 'deadline is invalid'
        end
    end
end

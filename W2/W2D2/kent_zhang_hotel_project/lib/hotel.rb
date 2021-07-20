require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash_capacities)
        @name = name
        @rooms = {}

        hash_capacities.each { |k,v| @rooms[k] = Room.new(v) }
    end

    def name
        cap_name = @name
        words = cap_name.split(" ")
        (words.map { |word| word.capitalize}).join(" ")
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts 'sorry, room does not exist'
        else
            if @rooms[room_name].add_occupant(person)
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        @rooms.each do |k, v|
            return true if !v.full?
        end

        return false
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name + ".*" + room.available_space.to_s
        end
    end

end

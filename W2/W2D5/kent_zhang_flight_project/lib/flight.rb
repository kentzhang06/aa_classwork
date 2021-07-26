class Flight
    attr_reader :passengers
    def initialize(flight, capacity)
        @flight_number = flight
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map { |p| p.name }
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end
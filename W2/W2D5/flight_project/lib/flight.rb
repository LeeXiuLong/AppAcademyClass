class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        self.passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number)
            if !self.full?
                self.passengers << passenger
            end
        end
    end

    def list_passengers 
        self.passengers.map { |passenger| passenger.name}
    end

    def [](index)
        self.passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end
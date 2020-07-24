require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = rooms
        @rooms.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
        new = @name.split.map {|word| word.capitalize }
        new.join(' ')
    end

    def room_exists?(room_name)
        self.rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        if rooms.all? {|room_name, room| room.full?}
            return false
        else
            return true
        end
    end

    def list_rooms
        list = "/"
        rooms.each do |room_name, room|
            list += room_name + ".*" + room.available_space.to_s + "\n"
        end
        puts list += "/"
    end
end

# h = Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)
# p h.name #"hilbert's grand hotel"
# p h.rooms #{"Basement"=>4, "Attic"=>2, "Under the Stairs"=>1}
# p h.list_roomscd ..


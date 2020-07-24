class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        return false if date_arr[0].length != 4
        return false if !(1..12).include?(date_arr[1].to_i)
        return false if !(1..31).include?(date_arr[2].to_i)
        true    
    end

    def initialize(title,deadline,description)
        raise "this is not a valid date" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        raise "this is not a valid date" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        if @done
            @done = false
        else
            @done = true
        end 
    end
end
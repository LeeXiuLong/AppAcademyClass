require_relative "item"

class List

    attr_accessor :label

    def initialize(label)
        @label = label 
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        new_item = Item.new(title, deadline, description)
        @items << new_item 
        true
    end

    def size
        @items.length 
    end 

    def valid_index?(index)
        !(index < 0) && !(index > @items.length - 1) 
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1] , @items[index_2] = @items[index_2] , @items[index_1]
        else 
            return false
        end
    end

    def [](index)
        if self.valid_index?(index)
            return @items[index]
        else
            return nil 
        end
    end

    def priority 
        @items[0]
    end

    def print
        puts self.label
        @items.each_with_index do |ele, i|
            if ele.done
                done_string = "Completed"
            else
                done_string = "Not Complete"
            end
            puts i.to_s + " " + ele.title + " " + ele.deadline + " " + done_string 
        end
    end

    def print_full_item(index)
        current_item = @items[index]
        if current_item.done
            done_string= "Completed"
        else
            done_string = "Not Complete"
        end
        puts current_item.title + " " + current_item.deadline 
        puts current_item.description + " " + done_string
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        if self.valid_index?(index)
            n = 0
            while n < amount
                if index >= 1
                    self.swap(index, index-1)
                    index -= 1
                    n += 1
                else
                    break
                end
            end
            return true
        else
            return false
        end
    end

    def down(index, amount=1)
        if self.valid_index?(index)
            n = 0
            while n < amount
                if index <= @items.length - 1
                    self.swap(index, index+1)
                    index += 1
                    n += 1
                else
                    break
                end
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if self.valid_index?(index)
            @items.delete_at(index)
            return true
        else
            return false
        end
    end

    def purge
        @items = @items.reject {|ele| ele.done}
    end
end
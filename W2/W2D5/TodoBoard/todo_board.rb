require_relative "list"


class TodoBoard

    attr_reader :label

    def initialize(label)
        @lists =  {}
        @label = label
    end

    def get_command
        p "Enter a command "
        cmd, list, *args = gets.chomp.split(" ")
        case cmd 
        when "showall"
            p self.label
            @lists.each { |k,v| v.print}
        when "ls"
            @lists.each { |k, v| puts k}
        when "mklist"
            @lists[list] = List.new(list)
        when "mktodo"
            @lists[list].add_item(*args)
        when "quit" 
            return false 
        when "up" 
            new_args = args.map {|ele| ele.to_i} 
            @lists[list].up(*new_args)
        when "down" 
            new_args = args.map {|ele| ele.to_i} 
            @lists[list].down(*new_args)
        when "swap"
            new_args = args.map {|ele| ele.to_i} 
            @lists[list].swap(*new_args)
        when "sort" 
            @lists[list].sort_by_date!
        when "priority"
            @lists[list].print_priority
        when "print" 
            if args.length == 0 
                @lists[list].print 
            else  
                new_args = args.map {|ele| ele.to_i} 
                @lists[list].print_full_item(*new_args)
            end
        when "toggle"
            new_args = args.map {|ele| ele.to_i}
            @lists[list].toggle_item(*new_args)
        when "rm"
            new_args = args.map {|ele| ele.to_i}
            @lists[list].remove_item(*new_args)
        when "purge"
            @lists[list].purge
        else  
            puts "Sorry, that command is not recognized"
        end
        true     
    end

    def run
        while self.get_command == true
            if self.get_command == false
                break
            end
        end 
    end

end

my_board = TodoBoard.new("My Lists")
my_board.run

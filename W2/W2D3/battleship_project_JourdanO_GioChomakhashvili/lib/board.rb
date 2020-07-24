class Board
    attr_accessor :grid, :size
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = grid.flatten.length
    end

    def [](arr)
        row = arr[0]
        column = arr[1]
        self.grid[row][column]
    end

    def []= (position, value)
        row = position[0]
        column = position[1]
        self.grid[row][column] = value
    end

    def num_ships
        self.grid.flatten.count {|ele| ele == :S}
    end

    def attack(position)
       if self[position] == :S 
         self[position] = :H
         p "you sunk my battleship!"
         return true
       else
        self[position] = :X
        return false
       end
    end

    # This fails because the random ships could be placed in the same spot 
    # since we are only checking the amount of times a ship is placed
    # rather than the actual number of ships on the grid.
    # def place_random_ships
    #     num_ships_needed = self.grid.flatten.length / 4
    #     ships_placed = 0
    #     n = self.grid.length
    #     while ships_placed <= num_ships_needed
    #         new_arr = [rand(n-1), rand(n-1)]
    #         self[new_arr] = :S
    #         ships_placed += 1
    #     end
    # end

    def place_random_ships
        num_ships_needed = self.grid.flatten.length / 4
        n = self.grid.length
        while self.num_ships < num_ships_needed
            new_arr = [rand(n-1), rand(n-1)]
            self[new_arr] = :S
        end
    end

    def hidden_ships_grid
        self.grid.map do |subarray|
            subarray.map.with_index {|ele, i| ele == :S ? :N : ele}
        end
    end

    def self.print_grid(matrix)
        matrix.each do |subarray|
            puts subarray.join(" ")
        end
    end

    def cheat
        Board::print_grid(self.grid)
    end

    def print
        Board::print_grid(self.hidden_ships_grid)
    end
end
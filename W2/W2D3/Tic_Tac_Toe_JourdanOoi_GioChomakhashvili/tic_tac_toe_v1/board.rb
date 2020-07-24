class Board
    attr_accessor :game_grid
    def initialize
        @game_grid = Array.new(3) {Array.new(3,"_")}
    end

    def valid?(position) # 
        row = position[0]
        column = position[1]
        return false if position.length != 2 || row < 0 || column < 0 
        return self.game_grid.length > row && self.game_grid[0].length > column
    end

    def empty?(position)
        return true if self[position] == '_'
        false
    end

    def [](position)
        row = position[0]
        column = position[1]
        self.game_grid[row][column]
    end

    def []=(position, mark)
        row = position[0]
        column = position[1]
        self.game_grid[row][column] = mark
        p self.game_grid
    end

    def place_mark(position, mark)
        raise 'not valid position or mark' if !self.valid?(position) || !self.empty?(position)
        self[position] = mark.upcase
    end

    def print
        self.game_grid.each { |subarray| p subarray.join(" ") }
    end

    def win_row?(mark)
        self.game_grid.each { |subarray| return true if subarray.all?(mark) }
        false
    end

    def win_col?(mark)
        self.game_grid.transpose.each { |subarray| return true if subarray.all?(mark) }
        false
    end

    # def win_diagonal?(mark)
    #     count = 0
    #     i = 0
    #     while i < self.game_grid.length
    #         count += 1 if self.game_grid[i][i] == mark
    #         i += 1
    #     end
    #     if count == self.game_grid.length
    #         return true
    #     else
    #         count = 0
    #         i = 0
    #     end
    #     y = self.game_grid.length - 1
    #     while y >= 0
    #         count += 1 if self.game_grid[i][y] == mark
    #         i += 1
    #         y -= 1
    #     end
    #     if count == self.game_grid.length
    #         return true
    #     end
    #     false
    # end

    def check_diag(matrix, mark)
        count = 0
        i = 0
        while i < matrix.length
            count += 1 if matrix[i][i] == mark
            i += 1
        end
        count == matrix.length
    end

    def win_diagonal?(mark)
        reversed_matrix = self.game_grid.reverse
        check_diag(self.game_grid, mark) || check_diag(reversed_matrix, mark)
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        self.game_grid.flatten.any?("_")
    end
end

#                                 0 > 1 > 2                     3 - 2 -1 
# arr.each_with_index.map {|ele, i| ele}.reverse_each {p i}

board1 = Board.new
p board1
p board1.valid?([1,2])
p board1.empty?([1,1])
# board1.game_grid[1][1] = :X
p board1.game_grid
p board1.empty?([1,1])
p board1.empty?([1,2])
# p board1.place_mark([0,0], :x)
# p board1.place_mark([0,1], :x)
# p board1.place_mark([2,0], :x)

# p board1.place_mark([1,1], :O)
# p board1.place_mark([2,1], :O)
board1.print
# p board1.win_row?(:X)
# p board1.win_col?(:O)
p board1.win?(:X)
p board1.empty_positions?


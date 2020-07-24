class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p "Please enter two numbers in the format of row column"
        input = gets.chomp
        position = input.split(" ").map(&:to_i)
        while !legal_positions.include?(position) || position.length != 2
            p "That is not a legal position, please choose a legal position B*TCH"
            input = gets.chomp
            position = input.split(" ").map(&:to_i)
        end
        position
    end
end
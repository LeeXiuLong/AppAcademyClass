class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Please enter two numbers in the format of row column"
        input = gets.chomp
        position = input.split(" ").map(&:to_i)
        raise "this is invalid input" if position.length != 2
        position
    end
end
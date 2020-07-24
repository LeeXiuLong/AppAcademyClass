require_relative "board"
require_relative "card"

require "byebug"

class Game

    def initialize(board_size)
        @board = Board.new(board_size)
        @deck = self.create_deck
        @previous_guess = nil
    end

    def create_deck
        deck = []
        symbols = [:A, :K, :Q, :J, 10, 9 , 8, 7, 6, 5, 4, 3, 2]
        (0...@board.grid.flatten.length/2).each do |index|
            2.times { deck << Card.new(symbols[index])}
        end
        deck
    end

    def make_guess
        p "Please make a guess in the format of row column and no larger than #{@board.grid.length-1}"
        guess = gets.chomp
        pos = guess.split.map {|ele| ele.to_i}
        if pos.all?{|ele| ele >= 0 && ele < @board.grid.length}
            return pos
        else
            make_guess
        end
    end

    def play_game
        @board.populate(@deck)
        first_guess = true
        while !@board.won?
            @board.render
            pos = self.make_guess
            guess = @board.guessed_pos(pos)
            if first_guess
                p "Your first guess is: #{guess}"
                @previous_guess = guess
                first_guess = false
                next
            else   
                if guess == @previous_guess
                    p "Correct you found a match!" 
                else
                    p "incorrect guess"
                    @board.render
                    @previous_guess.hide
                    guess.hide
                    puts "\n"
                end
                @previous_guess = nil
                guess = nil
                first_guess = true
            end
        end
    end




end

g = Game.new(4)
g.play_game
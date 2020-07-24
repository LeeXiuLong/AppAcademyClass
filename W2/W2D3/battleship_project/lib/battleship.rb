require_relative "board"
require_relative "player"

class Battleship
    attr_accessor :board, :player, :remaining_misses

    def initialize(board_length)
        @player = Player.new()
        @board = Board::new(board_length)
        @remaining_misses = (board_length * board_length) / 2
    end

    def start_game
        self.board.place_random_ships
        p self.board.num_ships
        self.board.print
    end

    def lose?
        if self.remaining_misses <= 0
            p 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if self.board.num_ships == 0
            p 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        self.remaining_misses -= 1 unless self.board.attack(self.player.get_move) 
        self.board.print
        p self.remaining_misses
    end
end
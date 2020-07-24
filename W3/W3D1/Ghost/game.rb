require_relative "player"

class Game(name1, name2)
    def initialize 
        @fragment = ""
        @dictionary = {}
        @player_1 = Player.new(name1)
        @player_2 = Player.new(name2)
        @current_player = @player_1
        @previous_player = @player_2
    end

    def next_player!
        if @current_player == @player_1
            @current_player, @previous_player = @player_2, @player_1 
        else 
            @current_player, @previous_player = @player_1, @player_2 
    end

    def take_turn
        current_guess = @current_player.get_guess
        if @current_pl
    end
end
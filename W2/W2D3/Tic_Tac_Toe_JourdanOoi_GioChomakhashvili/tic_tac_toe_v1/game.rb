require_relative "human_player"
require_relative "board"

class Game

    attr_reader :player_1, :player_2, :current_player, :board

  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_player = @player_1
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark)
      if board.win?(@current_player.mark)
        puts "Congratulations, you win!"
        @board.print
        return
      else
        self.switch_turn
      end
    end
    puts "nobody wins!"
  end

end

# p1 = HumanPlayer.new(:X)
# p2 = HumanPlayer.new(:O)
# new_game = Game.new(:X, :O)
# new_game.switch_turn
# p new_game.current_player
# new_game.switch_turn
# p new_game.current_player
# new_game.switch_turn
# p new_game.current_player


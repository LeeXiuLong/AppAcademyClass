require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node = TicTacToeNode.new(game.board, mark)
    new_node.children.each { |child| return child.prev_move_pos if child.winning_node?(mark)}
    new_node.children.any? { |child| return child.prev_move_pos if !child.losing_node?(mark)}
    raise "You don't win because the computer didn't play its best"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end


  def losing_node?(evaluator)
    return true if self.board.over? && !self.board.tied? && self.board.winner != evaluator
    return false if self.board.over? && self.board.winner == evaluator
    return false if self.board.over? && self.board.tied?
    if evaluator == self.next_mover_mark
      return self.children.none? {|node| !node.losing_node?(evaluator) } ? true : false
    else
      return self.children.any? {|node| node.losing_node?(evaluator) } ? true : false
    end
  end

  def winning_node?(evaluator)
    return true if self.board.over? && self.board.winner == evaluator
    return false if self.board.over? && self.board.winner != evaluator
    if evaluator == self.next_mover_mark
      self.children.any? {|node| node.winning_node?(evaluator)} ? true : false
    else
      self.children.all? {|node| node.winning_node?(evaluator)} ? true : false
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_states = []
    possible_moves = []
    (0...3).each do |row|
      (0...3).each do |column|
        possible_moves << [row, column] if @board.empty?([row,column])
      end
    end
    possible_moves.each do |pos|
      new_board = @board.dup
      new_board[pos] = @next_mover_mark
      @next_mover_mark == :x ? new_next = :o : new_next = :x
      possible_states << TicTacToeNode.new(new_board, new_next, pos)
    end
    possible_states
  end
end

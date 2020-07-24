class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
      @mark = mark
  end

  def get_position(legal_positions)
      position = legal_positions.sample
      p "computer played #{self.mark} at #{position}"
      position
  end
end
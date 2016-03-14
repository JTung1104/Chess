require_relative "display"

class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move(start_pos, end_pos)

  end
end

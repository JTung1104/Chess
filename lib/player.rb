require_relative "display"

class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{color.capitalize}'s turn. Move to where?"
        end_pos = display.get_input

        display.reset! if end_pos
      else
        puts "#{color.capitalize}'s turn. Pick a piece to move."
        start_pos = display.get_input

        display.reset! if start_pos
      end
    end

    [start_pos, end_pos]
  end
end

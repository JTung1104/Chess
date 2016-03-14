require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    '♛'.colorize(color)
  end
end

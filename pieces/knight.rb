require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  def symbol
    '♞'.colorize(color)
  end
end

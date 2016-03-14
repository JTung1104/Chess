require_relative 'piece'

class NullPiece < Piece
  def initialize(color, board, pos)
    @board = board
    @pos = pos
  end

  def moves
    []
  end

  def color
    :none
  end

  def symbol
  end

  def empty?
    true
  end

  def to_s
    "   "
  end
end

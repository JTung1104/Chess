class Piece
  def initialize(color, board, pos)
    raise 'invalid color' unless [:white, :black].include?(color)
    raise 'invalid pos' unless board.valid_pos?

    @color, @board, @pos = color, board, pos

    board.add_piece(self, pos)
  end

  def empty?
    false
  end

  def symbol
  end

end

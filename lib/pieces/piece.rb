class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(color, board, pos)
    raise 'invalid color' unless [:white, :black].include?(color)
    raise 'invalid pos' unless board.valid_pos?(pos)

    @color, @board, @pos = color, board, pos

    board.add_piece(self, pos)
  end

  def empty?
    false
  end

  def symbol
    raise NotImplementedError
  end

  def to_s
    " #{symbol} "
  end

  def valid_moves
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end

  def move_into_check?(end_pos)
    new_board = board.dup
    new_board.move_piece!(pos, end_pos)
    new_board.in_check?(color)
  end
end

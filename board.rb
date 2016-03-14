require_relative 'pieces'

class Board
  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8) }
    populate if fill_board
  end

  def move(start_pos, end_pos)
    raise 'no piece at start position' if empty?(start_pos)
    raise 'invalid end position' unless valid_pos?(end_pos)
  end

  def move_piece!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def [](pos)
    raise 'invalid pos' unless valid_pos?(pos)

    i, j = pos
    @grid[i][j]
  end

  def []=(pos, piece)
    raise 'invalid pos' unless valid_pos?(pos)

    i, j = pos
    @grid[i][j] = piece
  end

  def add_piece(piece, pos)
    raise 'position not empty' unless empty?(pos)

    self[pos] = piece
  end

  def populate

  end

  def empty?(pos)
    self[pos].empty?
  end

  def valid_pos?(pos)
    pos.all? { |coord| (0..7).cover?(coord) }
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end

  def pieces
    @grid.flatten.reject { |piece| piece.empty? }
  end
end

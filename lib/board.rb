require_relative 'pieces'
require 'byebug'

class Board
  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8, NullPiece.new) }
    populate if fill_board
  end

  def move_piece(turn_color, start_pos, end_pos)
    raise 'No piece at start position' if empty?(start_pos)
    piece = self[start_pos]

    if piece.color != turn_color
      raise "Move your own piece"
    elsif !piece.moves.include?(end_pos)
      raise "Can't move there"
    elsif !piece.valid_moves.include?(end_pos)
      raise "You cannot move into check"
    end

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]

    self[end_pos] = piece
    self[start_pos] = NullPiece.new
    piece.pos = end_pos
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
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    back_row.each_with_index do |piece, i|
      piece.new(:white, self, [0, i])
      piece.new(:black, self, [7, i])
    end

    8.times do |j|
      Pawn.new(:white, self, [1, j])
      Pawn.new(:black, self, [6, j])
    end
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

  def checkmate?(color)
    return false unless in_check?(color)
    pieces.select { |p| p.color == color}.all? { |p| p.valid_moves.empty? }
  end

  def in_check?(color)
    king_pos = pieces.select { |p| p.color == color && p.class == King }.first.pos
    pieces.any? { |p| p.color != color && p.moves.include?(king_pos) }
  end
end

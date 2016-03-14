require_relative 'pieces'
require 'byebug'

class Board
  def initialize(fill_board = true)
    @grid = Array.new(8) { Array.new(8, NullPiece.new) }
    populate if fill_board
  end

  def move_piece(start_pos, end_pos)
    raise 'no piece at start position' if empty?(start_pos)

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def move_piece!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
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

  def checkmate?
  end
end

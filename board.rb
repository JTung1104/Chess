require_relative 'pieces'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
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

  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
      end
    end
  end

  def valid_pos?(pos)
    (0...8).cover?(pos[0]) && (0...8).cover?(pos[1])
  end
end

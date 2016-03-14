require_relative 'pieces'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def move(start, end)
  end

  def [](row, col)
    @grid[row][col]
  end

  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |col, j|

  end
end

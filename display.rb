require 'colorize'
require_relative 'cursorable'
require_relative 'board.rb'

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def render
    system("clear")

    row, col = 0, 0
    bg_color = ""

    puts "  A B C D E F G H"
    while row < 8
      print "#{row} "
      while col < 8
        bg_color = (col.even? ? :black : :blue) if row.even?
        bg_color = (col.odd? ?  :black : :blue) if row.odd?
        bg_color = :yellow if [row, col] == @cursor_pos

        print "#{@board[row,col]} ".colorize(:background => bg_color)
        col += 1
      end

      puts
      col = 0
      row += 1
    end
  end
end

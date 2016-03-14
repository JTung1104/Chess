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
  end
end

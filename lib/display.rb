require 'colorize'
require_relative 'cursorable'
require_relative 'board.rb'

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @messages = {}
  end

  def render
    system("clear")
    puts "Arrow keys, or WASD to move, space or enter to confirm."
    i, j = 0, 0
    bg_color = ""

    while i < 8
      while j < 8
        bg_color = (i + j).even? ? :light_green : :light_blue
        bg_color = :magenta if [i, j] == @cursor_pos
        print "#{@board[[i, j]]} ".colorize(:background => bg_color)

        j += 1
      end
      puts
      j = 0
      i += 1
    end

    @messages.each do |key, val|
      puts "#{val}"
    end
  end
end

def reset!
  @messages.delete(:error)
end

def uncheck!
  @messages.delete(:check)
end

def set_check!
  @messages[:check] = "Check!"
end

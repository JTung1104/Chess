require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :display, :current_player, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move
        board.move_piece(current_player, start_pos, end_pos)
        swap_turn!
      rescue StandardError => e
        display.messages[:error] = e.message
        retry
      end
    end

    display.render
    puts "#{current_player.capitalize} is checkmated."
  end

  private

  def swap_turn!
    @current_player = (current_player == :white) ? :black : :white
  end

  def notify_players
    if board.in_check?(current_player)
      display.set_check!
    else
      display.uncheck!
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end

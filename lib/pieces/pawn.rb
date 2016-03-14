require_relative 'piece'

class Pawn < Piece
  def symbol
    '♟'.colorize(color)
  end

  def moves
    forward_steps + attacks
  end

  private

  def in_start_row?
    pos[0] == (color == :white ? 1 : 6)
  end

  def forward_dir
    color == :white ? 1 : -1
  end

  def forward_steps
    i, j = pos
    one_step = [i + forward_dir, j]
    return [] unless board.valid_pos?(one_step) && board.empty?(one_step)

    steps = [one_step]
    two_step = [i + 2 * forward_dir, j]
    steps << two_step if in_start_row? && board.empty?(two_step)
    steps
  end

  def attacks
    i, j = pos

    side_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]
    side_moves.select do |new_pos|
      board.valid_pos?(new_pos) &&
      !board.empty?(new_pos) &&
      board[new_pos].color != color
    end
  end
end

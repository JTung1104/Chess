module Slideable
  STANDARD_DIRS = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ]

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

  def moves
    moves = []

    move_dirs.each do |dx, dy|
      moves += get_moves_in_dir(dx, dy)
    end

    moves
  end

  def standard_dirs
    STANDARD_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private

  def move_dirs
    raise NotImplementedError
  end

  def get_moves_in_dir(dx, dy)
    x, y = pos
    moves = []

    while true
      x += dx
      y += dy
      pos = [x, y]

      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color
        break
      end
    end

    moves
  end
end

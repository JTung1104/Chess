module Stepable
  def moves
    moves = []

    move_diffs.each do |dx, dy|
      x, y = pos
      pos = [x + dx, y + dy]

      next unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
    end

    moves
  end

  private

  def move_diffs
    raise NotImplementedError
  end
end

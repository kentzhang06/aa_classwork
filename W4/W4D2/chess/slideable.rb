module Slideable
  HORIZONTAL_DIRS = [[-1, 0], [0, -1], [1, 0], [0, 1]]
  DIAGONAL_DIRS = [[-1, 1],[-1, -1],[1, 1],[1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
     
  end

  private

  def move_dirs
    HORIZONTAL_DIRS.concat(DIAGONAL_DIRS)
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    row, col = pos
    new_dx, new_dy = row + dx, col + dy
    curr_piece = board[new_dx, new_dy]
    while curr_piece.is_a?(NullPiece) && on_board?([new_dx, new_dy]) && color != curr_piece.color
      
    end

  end

  def on_board?(pos)
    row, col = pos
    row >= 0 && row < 8 && col >= 0 col < 8
  end

  # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping
end


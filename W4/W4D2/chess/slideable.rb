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
    result = []
    move_dirs.each do |dir|
      row, col = dir
      result += grow_unblocked_moves_in_dir(row, col)
    end
    result
  end

  private

  def move_dirs
    HORIZONTAL_DIRS.concat(DIAGONAL_DIRS)
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    result = []
    new_dx, new_dy = pos

    while true
      new_dx, new_dy = new_dx + dx, new_dy + dy #increment
      new_pos = [new_dx, new_dy] #assign new_pos
      curr_piece = board[new_pos] #store current piece

      break if !on_board?(new_pos) || color == curr_piece.color # not on board, and current piece is not null and is the same color

      result << new_pos #add new position to result array
      if curr_piece.color != color && curr_piece.is_a?(Piece) && !curr_piece.is_a?(NullPiece) # if piece is occupied with opposite color
        break
      end
      #break if curr_piece.color != color # if piece is occupied with opposite color
    end
    result
  end

end


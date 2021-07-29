require_relative 'piece'

class Pawn
  def initialize(pos, board, symbol)
    super
  end

  def symbol

  end

  def moves

  end

  private

  def at_start_row?
    row, col = pos
    piece = board[pos]
    (piece.color == white && row == 1) || (piece.color == black && row == 6)
  end

  def forward_dir
    result = []

    case symbol
    
    when white
      result.push([2, 0], [1, 0]) if at_start_row?
      result.push([1, 0])
    when black
      result.push([-2, 0], [-1, 0]) if at_start_row?
      result.push([-1, 0])
    end

    result
    # at start row, if white [2, 0] [1, 0], if black [-2, 0] [-1, 0]
    # other white [1, 0], black [-1, 0]
  end

  def forward_steps
    result = []

    forward_dir.each do |dir|
      dx, dy = dir
      row, col = pos
      new_pos = [row + dx, col + dy]
      curr_piece = board[new_pos]

      result << new_pos if on_board?(new_pos) && curr_piece.is_a?(NullPiece)
    end
  end

  def side_attacks

  end

end
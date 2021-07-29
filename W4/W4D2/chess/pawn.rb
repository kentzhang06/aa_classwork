require_relative 'piece'

class Pawn < Piece
  def initialize(pos, board, symbol)
    super
  end

  def symbol
    color
  end

  def moves
    side_attacks + forward_steps
  end

  #private

  def at_start_row?
    row, col = pos
    piece = board[pos]
    (piece.color == :white && row == 1) || (piece.color == :black && row == 6)
  end

  def forward_dir
    result = []

    case symbol
    
    when :white
      result.push([2, 0]) if at_start_row?
      result.push([1, 0])
    when :black
      result.push([-2, 0]) if at_start_row?
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
    result
  end

  def side_attacks
    result = []
    sides.each do |dir|
      dx, dy = dir
      row, col = pos
      new_pos = [row + dx, col + dy]
      curr_piece = board[new_pos]
      result << new_pos if on_board?(new_pos) && (curr_piece.color != color && !curr_piece.is_a?(NullPiece))
    end
    result

  end

  def sides
    dirs_white = [[1, -1], [1, 1]]
    dirs_black = [[-1, 1], [-1, -1]]
    if color == :white
      dirs_white
    else
      dirs_black
    end
  end
end
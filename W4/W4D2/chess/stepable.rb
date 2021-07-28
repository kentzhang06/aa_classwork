module Stepable
    def moves
        result = []
        move_diffs.each do |diff|
            dx, dy = diff
            row, col = pos
            new_pos = [row + dx, col + dy]
            curr_piece = board[new_pos]
            if on_board?(new_pos) && (curr_piece.is_a?(NullPiece) || curr_piece.color != color)
                result << new_pos
            end 
        end
        result
    end

    def move_diffs
    end

    def on_board?(pos)
        row, col = pos
        row >= 0 && row < 8 && col >= 0 && col < 8
      end

    # create array to collect moves

    # iterate through each of the piece's possible move_diffs
      # for each move_diff, increment the piece's position to generate a new position
      # add the new position to the moves array if it is:
        # on the board and empty
        # OR on the board and contains a piece of the opposite color

    # return the final array of moves
end
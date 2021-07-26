require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    all_moves = []

    
    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]
        
        if next_mover_mark == :x
          next_mover_mark = :o
        else
          next_mover_mark = :x
        end

        if self.board.empty?(pos)
          copy = self.board.dup
          copy[pos] = next_mover_mark
          prev_move_pos = pos
          all_moves << TicTacToeNode.new(copy, next_mover_mark, prev_move_pos)
        end
      end
    end
    all_moves
  end
end

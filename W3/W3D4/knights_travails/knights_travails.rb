require_relative "PolyTreeNode.rb"

class KnightPathFinder

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [@root_node]
  end

  def self.valid_moves(pos) #(4,5) -> [2, 4][2,6][3,3][3,7][5,3][5,7][6,4][6,6]
    #[0, 1] [0,2] [0,3] [0, 4] [0, 5][0, 6] [0,7]
    #[1, 1] [1,2] [1,3] [1, 4] [1, 5][1, 6] [1,7]
    #[2, 1] [2,2] [2,3] [2, 4] [2, 5][2, 6] [2,7]
    #[3, 1] [3,2] [3,3] [3, 4] [3, 5][3, 6] [3,7]
    #[4, 1] [4,2] [4,3] [4, 4] [4, 5][4, 6] [4,7]
    #[5, 1] [5,2] [5,3] [5, 4] [5, 5][5, 6] [5,7]
    #[6, 1] [6,2] [6,3] [6, 4] [6, 5][6, 6] [6,7]
    #[7, 1] [7,2] [7,3] [7, 4] [7, 5][7, 6] [7,7]
    array_moves = []
    array_moves << [pos[0]-2, pos[1]-1] << [pos[0]-2, pos[1]+1]
    array_moves << [pos[0]-1, pos[1]-2] << [pos[1]-1, pos[1]+2]
    array_moves << [pos[0]+1, pos[1]-2] << [pos[0]+1, pos[1]+2]
    array_moves << [pos[0]+2, pos[1]-1] << [pos[0]+2, pos[1]+1]

    array_moves.reject do |move|
      move[0] < 0 || move[0] > 7 || move[1] < 0 || move[1] > 7
    end
  end



end
module Slideable
  HORIZONTAL_DIRS = { 'N'=>[-1, 0], 'E'=>[0, -1], 'S'=>[1, 0], 'W'=>[0, 1] }
  DIAGONAL_DIRS = { 'NE'=>[-1, 1], 'NW'=>[-1, -1], 'SE'=>[1, 1], 'SW'=>[1, -1] }

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
    HORIZONTAL_DIRS.merge(DIAGONAL_DIRS)
  end

  def grow_unblocked_moves_in_dir(dx, dy)

  end
end


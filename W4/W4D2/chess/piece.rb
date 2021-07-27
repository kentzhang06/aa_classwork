require 'singleton'
class Piece

  def inspect
    print "Piece "
  end
end

class NullPiece < Piece
  include Singleton

  def inspect
    print "NullPiece "
  end
end
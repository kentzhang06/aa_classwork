class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    self.parent.children.delete(self) if self.parent
    @parent = node

    if @parent != nil && !node.children.include?(self)
      node.children << self
    end
  end

end
class BSTNode
  attr_accessor :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end

  def children
    children = []
    if @left
      children << @left
    end
    if @right
      children << @right
    end
    children
  end
end

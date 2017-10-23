# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    # byebug
    if @root == nil
      @root = BSTNode.new(value)
      # p @root
    else
      insert_somewhere(value, @root)
    end
  end

  def find(value, tree_node = @root)
    if tree_node.value == value
      return tree_node
    else
      if value < tree_node.value
        return nil if tree_node.left == nil
        find(value, tree_node.left)
      else
        return nil if tree_node.right == nil
        find(value, tree_node.right)
      end
    end
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end

  def insert_somewhere(value, parent)
    node = BSTNode.new(value)
    # byebug
    if value <= parent.value
      if parent.left == nil
        parent.left = node
        node.parent = parent
      else
        insert_somewhere(value, parent.left)
      end
    else
      if parent.right == nil
        parent.right = node
        node.parent = parent
      else
        insert_somewhere(value, parent.right)
      end
    end
  end





  private
  # optional helper methods go here:

end

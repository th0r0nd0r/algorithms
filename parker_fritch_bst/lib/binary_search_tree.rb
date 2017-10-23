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
    # byebug
    to_delete = self.find(value, @root)
    if to_delete.left == nil && to_delete.right == nil
      if to_delete == @root
        @root = nil
      else
        replace_parents_child(to_delete, to_delete.parent, nil)
      end

    elsif to_delete.left == nil || to_delete.right == nil
      if to_delete.left
        replace_parents_child(to_delete, to_delete.parent, to_delete.left)
      else
        replace_parents_child(to_delete, to_delete.parent, to_delete.right)
      end

    else
      replacement_node = maximum(to_delete.left)
      replace_parents_child(replacement_node, replacement_node.parent, replacement_node.left)
      replace_parents_child(to_delete, to_delete.parent, replacement_node)
      unless to_delete.children.empty?
        to_delete.children.each do |child|
          replace_childs_parent(child, replacement_node)
        end
      end

    end
  end

  def replace_parents_child(node, parent, new_node = nil)
    if parent.left == node
      parent.left = new_node
    else
      parent.right = new_node
    end

    if new_node != nil
      new_node.parent = parent
    end
  end

  def replace_childs_parent(child, new_parent)
    child.parent = new_parent
    if child.value <= new_parent.value
      new_parent.left = child
    else
      new_parent.right = child
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    # byebug
    if tree_node.right
      maximum(tree_node.right)
    else
      tree_node
    end
  end

  def depth(tree_node = @root)
    # byebug
    return 0 if tree_node.nil? || tree_node.children.empty?
    [depth(tree_node.left), depth(tree_node.right)].max + 1
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

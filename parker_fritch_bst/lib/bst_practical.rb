require_relative "binary_search_tree"

def in_order_traversal(tree_node = @root, arr = [])
  sorted_left = []
  sorted_right = []
  if tree_node.left
    sorted_left = in_order_traversal(tree_node.left, [])
  end
  if tree_node.right
    sorted_right = in_order_traversal(tree_node.right, [])
  end
  sorted_left << tree_node
  sorted_left + sorted_right
end

def kth_largest(tree_node, k)
  sorted = in_order_traversal(tree_node, [])
  length = sorted.length
  sorted[length - k]
end

# how do I have access to the BinarySearchTree that has k as the root?

# [0,1,1.5,2,3,4,5,7,9,10]
# largest num == 1st largest
# 7th largest == 2

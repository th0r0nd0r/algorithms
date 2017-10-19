require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    default_proc = Proc.new do |a,b|
      a > b
    end
    @store = []
    @prc = prc || default_proc
  end

  def count
  end

  def extract
    extract = @store.first
    last = @store.last
    @store[0] = last
    @store[-1] = extract
    @store.pop
    @store = BinaryMinHeap.heapify_down(@store, 0, @store.length)
    extract
  end

  def peek
  end

  def push(val)
    @store.push(val)
    # @store = BinaryMinHeap.heapify_down(@store, 0, @store.length)
    @store = BinaryMinHeap.heapify_up(@store, (@store.length - 1), @store.length)
    return val
  end

  public
  def self.child_indices(len, parent_index)
    idx1 = (2 * parent_index + 1)
    idx2 = (2 * parent_index + 2)
    indices = []
    indices << idx1 if idx1 < len
    indices << idx2 if idx2 < len
    indices
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise("root has no parent")
    else
      (child_index - 1) / 2
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new { |a,b| a <=> b}
    # byebug
    # p "prc"
    # p prc
    # byebug
    # while parent_idx < len
      children_indices = self.child_indices(len, parent_idx)
      children = {}
      children_indices.each do |i|
        children[array[i]] = i
      end

      return array if children_indices.empty?

        # while parent_idx.between?(0, array.length - 1)
          parent = array[parent_idx]
          to_swap = children.keys.min
          swap_idx = children[to_swap]
          if prc.call(to_swap, parent) < 0
            if to_swap > parent
              to_swap = children.keys.max
              swap_idx = children[to_swap]
            end
            swapping = parent
            array[parent_idx] = to_swap
            array[swap_idx] = swapping
          end
          heapify_down(array, swap_idx, len, &prc)
          # if parent == array[parent_idx]
          #   parent_idx = -1
          # else
          #   parent_idx = swap_idx
          # end
        # end
      # parent_idx += 1
      # end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new {|a,b| a <=> b}

    while child_idx > 0
      parent_index = self.parent_index(child_idx)
      parent = {}
      parent[array[parent_index]] = parent_index
      # p "prc"
      # p self.prc
      # unless children_indices.empty?
        child = array[child_idx]
        to_swap = parent.keys.first
        swap_idx = parent[to_swap]
        if prc.call(child, to_swap) < 0
          swapping = child
          array[child_idx] = to_swap
          array[swap_idx] = swapping
        end
      # end
      child_idx -= 1
    end
    array
  end
end

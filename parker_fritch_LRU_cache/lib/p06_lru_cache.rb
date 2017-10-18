require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
      return @map[key].val
    else
      calc!(key)
      if count > @max
        eject!
      end
      return @map[key].val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key

    square = @prc.call(key)
    new_node = @store.append(key, square)
    @map[key] = new_node
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    if node.next != @store.tail && node != @store.head
      node.prev.next = node.next
      node.next.prev = node.prev
      node.prev = @store.tail.prev
      @store.tail.prev.next = node
      node.next = @store.tail
      @store.tail.prev = node
    end
  end

  def eject!
    trash = @store.head.next
    head = @store.head
    head.next = trash.next
    trash.next.prev = head
    @map.delete(trash.key)
  end
end

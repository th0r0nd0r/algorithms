class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  attr_reader :head, :tail
  include Enumerable

  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    if @head.next != @tail
      @head.next
    end
  end

  def last
    if @tail.prev != @head
      @tail.prev
    end
  end

  def empty?
    (@head.next == @tail && @tail.prev == @head)
  end

  def get(key)
    current_node = @head
    while (current_node != @tail)
      if current_node.key == key
        return current_node.val
      end
      current_node = current_node.next
    end
  end

  def include?(key)
    current_node = @head
    while (current_node != @tail)
      if current_node.key == key
        return true
      end
      current_node = current_node.next
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
    return new_node
  end

  def update(key, val)
    current_node = @head
    while (current_node != @tail)
      if current_node.key == key
        current_node.val = val
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head.next
    while (current_node != @tail)
      if current_node.key == key
        current_node.remove
      end
      current_node = current_node.next
    end
  end

  def each(&prc)
    current_node = @head.next
    while (current_node != @tail)
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end

require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    list = bucket(key)
      list.include?(key)
  end

  def set(key, val)
    if @count >= num_buckets
      resize!
    end

    found = false
    list = bucket(key)
      list.each do |node|
        if node.key == key
          found = true
          node.val = val
        end
      end
    if !found
      list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    # p "key"
    # p key
    list = bucket(key)
    # p "list"
    # p list
    # p "list.get(key)"
    # p list.get(key)
    list.get(key)
  end

  def delete(key)
    list = bucket(key)
    list.remove(key)
    @count -= 1
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) {LinkedList.new}
    @count = 0
    old_store.each do |list|
      list.each do |node|
        key = node.key
        val = node.val
        self.set(key, val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    hashed_key = key.hash
    @store[hashed_key % num_buckets]
  end
end

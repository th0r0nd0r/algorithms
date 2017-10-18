require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    hashed_key = key.hash
    unless self[hashed_key].include?(key)
      self[hashed_key].push(key)
      @count += 1
    end
  end

  def include?(key)
    hashed_key = key.hash
      self[hashed_key].include?(key)
  end

  def remove(key)
    hashed_key = key.hash
    if include?(key)
      self[hashed_key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.each do |bucket|
      bucket.each do |num|
        self.insert(num)
      end
    end
  end
end

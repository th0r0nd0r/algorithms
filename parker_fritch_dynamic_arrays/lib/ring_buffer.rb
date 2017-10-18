require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @start_idx = 0
    @length = 0
  end

  # O(1)
  def [](index)
    if (index < @length) && index >= 0
      adjusted_index = (index + @start_idx) % @capacity
      @store[adjusted_index]
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def []=(index, val)
    if (index < @length) && index >= 0
      adjusted_index = (index + @start_idx) % @capacity
      @store[adjusted_index] = val
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def pop
    if @length > 0
      last = self[@length - 1]
      @length -= 1
      return last
    else
      puts("errorerroreror")
      raise("index out of bounds")
    end
  end

  # O(1) ammortized
  def push(val)
    if @length >= @capacity
      self.resize!
    end

    @length += 1
    self[@length - 1] = val
  end

  # O(1)
  def shift
    if @length > 0
      shifted = self[0]
      self[0] = nil
      @start_idx += 1
      @length -= 1
      # puts("length")
      # puts(@length)
      # puts("adjusted length")
      # puts(@length)
      return shifted
    else
      raise("index out of bounds")
    end
  end

  # O(1) ammortized
  def unshift(val)
    if @length >= @capacity
      resize!
    end
    @length += 1
    @start_idx = (@start_idx - 1) % @capacity
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_array = StaticArray.new(@capacity * 2)
    for i in 0..(@length - 1)
      new_array[i] = self[i]
    end
    @start_idx = 0
    @store = new_array
    @capacity = @capacity * 2
  end
end

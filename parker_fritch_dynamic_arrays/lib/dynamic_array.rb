require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length
  attr_reader :capacity

  def initialize
    @array = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @last = -1
  end

  # O(1)
  def [](index)
    if index < @length
      @array[index]
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def []=(index, value)
    if @array[index]
      @array[index] = value
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def pop
    if @length > 0
      @length -= 1
      @last -= 1
      return @array[@last + 1]
    else
      puts("errorerroreror")
      raise("index out of bounds")
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    # byebug
    if @length < @array.length
      @array[@last + 1] = val
      @last += 1
      @length += 1
    else
      new_array = StaticArray.new(@array.length * 2)
      for i in 0..(@length - 1)
        new_array[i] = @array[i]
      end
      new_array[@last + 1] = val
      @length += 1
      @array = new_array
      @capacity = @capacity * 2
    end
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length > 0
      new_array = StaticArray.new(@array.length - 1)
      for i in 0..(@length - 2)
        new_array[i] = @array[i + 1]
      end
      shifted = @array[0]
      @length -= 1
      @last -= 1
      @array = new_array
      return shifted
    else
      raise("index out of bounds")
    end
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length < @array.length
      (@length - 1).downto(0) do |i|
        @array[i + 1] = @array[i]
      end
      @array[0] = val
      @length += 1
      @last += 1
    elsif @length <= 0
      raise("index out of bounds")
    else
      new_array = StaticArray.new(@array.lengt * 2)
      new_array[0] = val
      for i in 0..(@length - 1)
        new_array[i + 1] = @array[i]
      end
      @array = new_array
      @length += 1
      @last += 1
    end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end

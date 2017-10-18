# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  attr_reader :array

  def initialize(length)
    @array = Array.new(length)
  end

  # O(1)
  def [](index)
    if @array[index]
      @array[index]
    else
      raise("index out of bounds")
    end
  end

  # O(1)
  def []=(index, value)
    if index < @array.length
      @array[index] = value
    else
      raise("index out of bounds")
    end
  end

  def length
    @array.length
  end

  protected
  attr_accessor :store
end

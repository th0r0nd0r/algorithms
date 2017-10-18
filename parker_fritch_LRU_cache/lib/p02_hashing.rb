require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed = []
    # p "array to hash"
    # p self
    self.each do |item|
      # p "item"
      # p item
      # byebug
      if item.is_a?(Array)
        # p "array"
        # p item
        # p "hashed"
        # p hashed
        # p "item"
        # p item
        # p "item.hash"
        # p item.hash
        hashed << item.hash
      else
        if item.is_a?(String)
          filtered_item = item.split('').map(&:ord).join
        elsif item.is_a?(Float)
          filtered_item = item.to_s.split('').map(&:ord).join
        elsif item.is_a?(Integer)
          # p "integer"
          # p item
          filtered_item = item
        elsif item.is_a?(Hash)
          filtered_item = item.hash
        elsif item.is_a?(Symbol)
          # p "symbol"
          # p item
          filtered_item = item.to_s.hash
        end
        item_and_index = self.index(item).to_s + filtered_item.to_s
        int_to_hash = item_and_index
        hashed << int_to_hash
      end
    end
    # p "hashed"
    # p hashed
    # p "the error?"
    # p hashed.join.to_i.hash
    hashed.join.hash
  end
end

class String
  def hash
    self.split('').map(&:ord).join.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array_from_hash = self.to_a.sort
    # byebug
    # puts("array?")
    # p array_from_hash.inspect
    # p array_from_hash
    # p "array from hash"
    # p array_from_hash
    array_from_hash.hash
  end
end

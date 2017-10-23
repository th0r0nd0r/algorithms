require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    array[1..-1].each do |el|
      if el <= pivot
        left << el
      else
        right << el
      end
    end
    QuickSort.sort1(left) + pivot + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    if length > 3
      pivot_idx = QuickSort.partition(array, start, length, &prc)
      p "begin"
      p pivot_idx
      p start
      p length
      p "end"
      QuickSort.sort2!(array, (pivot_idx + 1), (length - pivot_idx), &prc)
      QuickSort.sort2!(array, start, pivot_idx, &prc)
    end
    array
  end

  def self.partition(array, start, length, &prc)
    # byebug
    # swapped = false
    prc = prc || Proc.new {|x,y| x <=> y}
    pivot_idx = start
    partition_idx = start
    array[start..(start + length - 1)].each_with_index do |el, i|
      if prc.call(el, array[pivot_idx]) == -1
        array[partition_idx + 1], array[i + start] = array[i + start], array[partition_idx + 1]
        partition_idx += 1
        # swapped = true
      end
    end
    array[pivot_idx], array[partition_idx] = array[partition_idx], array[pivot_idx]
    p array[start..(start + length - 1)]
    # if swapped == false
    #   partition_idx += 1
    # end
    partition_idx
  end

end

class Array
  def quick_select(k)
    smallest_index = k - 1
    pivot_idx = Quicksort.partition(self, 0, self.length)
    return self[pivot_idx] if smallest_index == pivot_idx
    if smallest_index < pivot_idx
      self.quick_select(self, 0, pivot_idx)
    else
      self.quick_select(self, pivot_idx + 1, self.length)
    end
  end
end

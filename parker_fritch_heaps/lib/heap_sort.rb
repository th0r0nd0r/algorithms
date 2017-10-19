require_relative "heap"

class Array
  def heap_sort!
    BinaryMinHeap.heapify_down(self, 0, self.length)
    p self
    # BinaryMinHeap.heapify_down(self, 0, self.length)
    BinaryMinHeap.heapify_up(self, self.length - 1, self.length)
    p self
  end

end

arr = [5,3,9,1,4,7,8]

arr.heap_sort!.heap_sort!

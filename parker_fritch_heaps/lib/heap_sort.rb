require_relative "heap"

class Array
  def heap_sort!
    # parent_idx = 0
    # while parent_idx < self.length
    #   BinaryMinHeap.heapify_down(self, parent_idx, self.length)
    #   parent_idx += 1
    # end
    #
    # child_index = self.length - 1
    # while child_index > 0
    #   BinaryMinHeap.heapify_up(self, child_index, self.length)
    #   child_index -= 1
    # end


    (2..count).each do |slice|
     BinaryMinHeap.heapify_up(self, slice - 1, slice)
   end
   count.downto(2).each do |slice|
     self[slice - 1], self[0] = self[0], self[slice - 1]
     BinaryMinHeap.heapify_down(self, 0, slice - 1)
   end
   self.reverse!



    p self
    # BinaryMinHeap.heapify_down(self, 0, self.length)
    # BinaryMinHeap.heapify_up(self, self.length - 1, self.length)
    # p self
  end

end

# arr = [5,3,9,1,4,7,8]
#
# arr.heap_sort!.heap_sort!

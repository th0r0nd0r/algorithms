class DynamicProgramming

  def initialize
    @blair_cache = {1=> 1, 2=> 2}
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?
    n_minus_1th_odd = 1 + (2 * (n - 2))
    ans = blair_nums(n - 1) + blair_nums(n - 2) + n_minus_1th_odd
    @blair_cache[n] = ans
    return ans
  end

  def frog_hops_bottom_up(n)
    hops_cache = frog_cache_builder(n)
    hops_cache[n]
  end

  def frog_cache_builder(n)
    hops = [[[]], [[1]], [[1, 1], [2]]]

   (3..n).each do |num_stairs|
     ways_to_hop = []
     (1..3).each do |current_jump|
       hops[num_stairs - current_jump].each do |last_way|
         new_way = last_way + [current_jump]
         ways_to_hop << new_way
       end
     end
     hops << ways_to_hop
   end

   hops
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
    hops_cache = frog_cache_builder(n)
    hops_cache[n]
  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)
    knapsack_table(weights, values, capacity).last.last
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    table = Array.new(capacity + 1) {[]}
    weights_hash = {
      weights[0] => values[0],
      weights[1] => values[1],
      weights[2] => values[2]
    }

    weights.each_with_index do |weight, i|
      (0..capacity).each_with_index do |cap, j|
        if i == 0
          if weight < cap
            table[j] << weights_hash[weight]
          else
            table[j] << 0
          end
        else
          if weight < cap
            item_value = weights_hash[weight]
            p "item value"
            p item_value
            p "value you can add to item"
            p table[cap - weight][i - 1]
            total_value = table[cap - weight][i - 1] + item_value
            input = [total_value, table[cap][i - 1]].max
            table[j] << input
          else
            table[j] << table[j][i - 1]
          end
        end
      end

    end

    table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

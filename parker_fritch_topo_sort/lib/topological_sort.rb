require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

# def visit(vertex, visited, result, cycle)
#   # p "vertex"
#   # p vertex.value
#   # unless visited.include?(vertex)
#     visited.add(vertex)
#
#     vertex.out_edges.each do |edge|
#       if visited.include?(edge.to_vertex)
#         p "cycle"
#         cycle[0] = true
#       else
#         visit(edge.to_vertex, visited, result, cycle)
#       end
#     end
#
#     result.unshift(vertex)
#   # end
# end

def topological_sort(vertices)
  # visited = Set.new
  # # visited = Array.new(vertices.length, false)
  # cycle = [false]
  # result = []
  #
  # vertices.each do |vertex|
  #   unless visited.include?(vertex)
  #     visit(vertex, visited, result, cycle)
  #   end
  # end
  #
  # if cycle == [true]
  #   return []
  # else
  #   return result
  # end



















  queue = []
  result = []
  vertices.each do |vert|
    queue << vert if vert.in_edges.empty?
  end
  # byebug
  count = 0
  until queue.empty?
    vertex = queue.pop
    result << vertex
    to_destroy = []
    for i in (0..(vertex.out_edges.length - 1))
      edge = vertex.out_edges[i]
      if edge.to_vertex.in_edges.length == 1
        queue.push(edge.to_vertex)
      end
      to_destroy << edge
      i += 1
    end
    to_destroy.each do |edge|
      edge.destroy!
    end
    count += 1
  end
  result
end

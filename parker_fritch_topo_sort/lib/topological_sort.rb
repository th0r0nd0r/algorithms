require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)

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

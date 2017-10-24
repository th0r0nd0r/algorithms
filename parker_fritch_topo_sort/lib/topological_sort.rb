require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def visit(idx, visited, result, vertices)
  # p "vertex"
  # p vertex.value
  # unless visited.include?(vertex)
    vertex = vertices[idx]
    visited[idx] = true

    vertex.out_edges.each do |edge|
      if result.include?(edge.to_verex)
        return []
      else
        to_idx = vertices.index(edge.to_vertex)
        visit(to_idx, visited, result, vertices)
      end
    end

    result.unshift(vertex)
  # end
end

def topological_sort(vertices)
  # visited = Set.new
  visited = Array.new(vertices.length, false)
  result = []

  while visited.include?(false)
    idx = vertices[visited.index(false)]

    unless visited[idx] == true
      visit(idx, visited, result, vertices)
    end
  end

  result



















  # queue = []
  # result = []
  # vertices.each do |vert|
  #   queue << vert if vert.in_edges.empty?
  # end
  # # byebug
  # count = 0
  # until queue.empty?
  #   vertex = queue.pop
  #   result << vertex
  #   to_destroy = []
  #   for i in (0..(vertex.out_edges.length - 1))
  #     edge = vertex.out_edges[i]
  #     if edge.to_vertex.in_edges.length == 1
  #       queue.push(edge.to_vertex)
  #     end
  #     to_destroy << edge
  #     i += 1
  #   end
  #   to_destroy.each do |edge|
  #     edge.destroy!
  #   end
  #   count += 1
  # end
  # result
end

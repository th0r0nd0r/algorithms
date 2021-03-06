# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'
require_relative 'graph'

def install_order(arr)
  vertices = []
  arr.each do |tup|
    vertices << Vertex.new(tup[0])
  end
  arr.each do |tup|
  from_vertex = vertices[tup[1] - 1]
  to_vertex = vertices[tup[0] - 1]
  Edge.new(from_vertex, to_vertex)
  end

  topological_sort(vertices).map(&:value)
end

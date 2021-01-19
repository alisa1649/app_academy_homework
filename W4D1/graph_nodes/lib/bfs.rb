class GraphNode
  attr_accessor :neighbors, :value

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def self.bfs(starting_node, target_value)
    q = Queue.new
    visited = Set.new
    q.enq(starting_node)

    while !q.empty?
      current_node = q.deq
      if !visited.include?(current_node)
        visited.add(current_node)
        return current_node if current_node.value == target_value
        starting_node.neighbors.each { |ele| q.enq(ele) }
      end
    end
  end
end

a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")
d = GraphNode.new("d")
e = GraphNode.new("e")
f = GraphNode.new("f")
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

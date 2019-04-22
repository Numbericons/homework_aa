require 'byebug'
class GraphNode
    attr_accessor :val, :neighbors
    def initialize(val)
        @val = val
        @neighbors = []
    end

end
def bfs(starting_node, target_value)
    # return nil if (visited.include?(node.val))
    new_queue = [starting_node]
    visited = []

    until new_queue.empty?
        # debugger
        parent = new_queue.shift
        return parent if parent.val == target_value
        parent.neighbors.each do |neighbor|
            next if visited.include?(neighbor)
            new_queue+=[neighbor]
        end
        visited << parent
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [c]
c.neighbors = [b, d, e, f]
e.neighbors = [c]
f.neighbors = [c,d]

p bfs(a, "b")
p bfs(a, "f")
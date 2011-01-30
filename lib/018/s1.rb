
class Graph
  class Node
    attr_accessor :max_left, :max_right, :value, :pos, :row

    def initialize(pos, value, row, graph)
      @pos, @value, @row, @graph = pos, value, row, graph
    end

    def left()
      @graph.nodes[pos() + row()]
    end

    def right()
      @graph.nodes[pos() + row() + 1]
    end

    def leaf?
      left.nil?
    end
  end
  
  
  attr_accessor :nodes
  
  def self.load_values_from_file(file = "data_small.txt")
    File.readlines(file).map { |l| l.split.map(&:to_i) }
  end
  
  def initialize(values = self.class.load_values_from_file())
    @nodes = []
    values.each_with_index do |items, row|
      items.each { |val| @nodes << Node.new(@nodes.length, val, row+1, self) }
    end
  end

  def max_path()
    calc_max_path(@nodes[0])
  end
    
  def calc_max_path(n)
    if n.leaf?
      return n.value()
    elsif n.max_left() && n.max_right()
      return n.value()
    elsif n.max_left.nil?
      n.max_left = calc_max_path(n.left())
      n.max_right = calc_max_path(n.right())
    elsif n.max_right.nil?
      n.max_right = calc_max_path(n.right())
    end
    n.value = n.value() +  [n.max_left(), n.max_right()].max()
  end
end


if $0 == __FILE__
  values = Graph.load_values_from_file("data.txt")
  puts Graph.new(values).max_path()
end

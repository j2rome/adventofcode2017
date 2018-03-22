# coding: utf-8
class Day7
  
  def parse(line)
    m = /^(?<name>[[:lower:]]*)\s*\((?<weight>\d*)\)(\s*->\s*(?<childrens>.*$))?/.match(line)
    childrens = m[:childrens].split(',').map(&:strip) unless  m[:childrens].nil?
    Node.new(m[:name], m[:weight].to_i, childrens)
  end
    
  def solve(input)
    nodes = Hash.new
    input
      .each_line.map { |line| parse(line) }
      .map { |node| nodes[node.name] = node }
    tree = tree(nodes)
    
    root = tree.find_all { |node| node.parent.nil? }[0]
    root.name
  end


  def partition(visitors)
    sums = visitors.map(&:sum)
    sums.uniq.map {|i| [i, sums.count(i)]}
  end
  def select_unbalanced_node(visitors, sum_partitions)
    sum_different = sum_partitions.reject {|s| s[1] > 1}
    
    return nil if sum_different.empty?
    
    visitors.find { |v| v.sum == sum_different[0][0] }.node
  end

  def find(root)
    visitors = root.childrens.map {|c| v = WeightVisitor.new(c) ; c.accept(v); v }
    sum_partitions = partition(visitors)
    node = select_unbalanced_node(visitors, sum_partitions)
    if node.nil?
      puts "found #{root}"
      #noeud trouvé avec la somme de ces noeuds et la somme des autres noeuds
      return sum_partitions 
    end
    find(node)
  end
  
    
  def solve2(input)
    nodes = Hash.new
    input
      .each_line.map { |line| parse(line) }
      .map { |node| nodes[node.name] = node }
    tree = tree(nodes)
    root = tree.find_all { |node| node.parent.nil? }[0]
    puts find(root)
    
    root.name
  end

  def tree(nodes)
    nodes
      .each_value
      .reject { |n| n.childrens.nil? }
      .each do |node|
      childrens_name = node.childrens
      node.childrens = []
      childrens_name
        .map { |node_name| nodes[node_name] }
        .map { |child_node| child_node.add_parent(node) }
    end
  end


  class WeightVisitor

    attr_accessor :sum, :node
    
    def initialize(node)
      @sum = 0
      @node = node
    end
    
    def visit(node)
      @sum += node.weight
    end
  end

  class Node

    attr_accessor :weight, :name, :childrens, :parent
   
    def initialize(name, weight, childrens = [])
      @name  = name
      @childrens = childrens
      @weight = weight
    end

    def add_parent(node)
      @parent = node
      node.add(self)
    end
  
    def add(children)
      childrens << children
    end

    def leaf?
      childrens.nil?
    end
   
    def accept(visitor)
      childrens.map { |n| n.accept(visitor) } unless leaf?
      visitor.visit(self)
    end

    def to_s
      "#{name} #{weight}"
    end
  end
end

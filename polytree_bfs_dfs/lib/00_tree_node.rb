class PolyTreeNode
   attr_accessor :value, :children, :parent

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  

  def parent=(node)
    self.parent.children.delete(self) if !self.parent.nil?
    @parent = node

    unless node.nil? || node.children.include?(self)  
      node.children << self 
    end
  end

  def add_child(child_node)
    self.children << child_node
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "error" if !children.include?(child_node)
    self.children.delete(child_node)
    child_node.parent=(nil)
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child| 
      node = child.dfs(target_value)
      return node if node
    end
    nil
  end

  def bfs(target_value)
    #return here maybe??
    array = [self] 
    until array.empty?
      current_node = array.shift
      return current_node if current_node.value == target_value
      array += current_node.children 
    end
    nil
  end
 
end
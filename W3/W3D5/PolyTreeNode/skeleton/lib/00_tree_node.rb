require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        @parent.children.delete(self) if @parent != nil
        if parent_node == nil
            @parent = nil 
        else
            # @parent.children.each {|child|@parent.children.delete(child) if child == self}
            @parent = parent_node
            parent_node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "This is not a child of this node" if !self.children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self == nil
        self.children.each do |child|
            # debugger
            result = child.dfs(target_value) 
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        while !queue.empty?
            el = queue.shift
            el.children.each {|child| queue << child}
            return el if el.value == target_value
        end
    end

end
require_relative "polytreenode"

class KnightPathFinder
    attr_reader :root_node

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        self.build_move_tree
    end

    def new_move_positions
    end

    def self.valid_moves(pos)
        valid_moves = []
        possible_changes = [[2,1],[1,2],[-1,-2],[-2,-1],[2,-1],[-1,2],[-2,1],[2,-1]]
        possible_changes.each do |change|
            x = pos[0] + change[0]
            y = pos[1] + change[1]
            valid_moves << [x,y] if [x,y].all? {|ele| ele >= 0 && ele < 8}
        end
        valid_moves
    end

    def new_move_positions(pos)
        # debugger
        new_moves = []
        KnightPathFinder.valid_moves(pos).each do |ele| 
            new_moves << ele unless @considered_positions.include?(ele)
        end
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            current_move = queue[0]
            p current_move.value
            queue += self.possible_moves(current_move)
            queue.shift
        end
    end

    def possible_moves(node)
        pos = node.value
        # debugger
        new_moves = self.new_move_positions(pos)
        children = new_moves.map {|move| PolyTreeNode.new(move) }
        children.each {|child| child.parent = node}
        children
    end

    def find_path(end_pos)
        final_node = self.root_node.bfs(end_pos)
        self.trace_path_back(final_node)
    end

    def trace_path_back(end_pos)
        current_node = end_pos
        path_arr = []
        until current_node.parent == nil
            path_arr.unshift(current_node.value)
            current_node = current_node.parent
        end
        path_arr.unshift(current_node.value)
        path_arr
    end

end

# knight = KnightPathFinder.new([0,0])
# knight.build_move_tree

knight2 = KnightPathFinder.new([0,0])
p knight2.root_node
p knight2.find_path([7,6])
p knight2.find_path([6,2])
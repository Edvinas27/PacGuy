# frozen_string_literal: true

module AStar
  Node = Struct.new(:x, :y, :g, :h, :f, :parent)

  def self.find_path(start, goal, walkable)
    open = []
    closed = {}
    start_node = Node.new(start[0], start[1], 0, 0, 0, nil)
    open << start_node

    until open.empty?
      current = open.min_by(&:f)
      return reconstruct_path(current) if [current.x, current.y] == goal

      open.delete(current)
      closed[[current.x, current.y]] = true

      neighbors(current).each do |nx, ny|
        next if closed[[nx, ny]] || !walkable.call(nx, ny)
        g = current.g + 1
        h = (goal[0] - nx).abs + (goal[1] - ny).abs
        f = g + h
        node = open.find { |n| n.x == nx && n.y == ny }
        if node
          if g < node.g
            node.g = g
            node.f = f
            node.parent = current
          end
        else
          open << Node.new(nx, ny, g, h, f, current)
        end
      end
    end
    []
  end

  def self.neighbors(node)
    [[node.x+1, node.y], [node.x-1, node.y], [node.x, node.y+1], [node.x, node.y-1]]
  end

  def self.reconstruct_path(node)
    path = []
    while node.parent
      path.unshift([node.x, node.y])
      node = node.parent
    end
    path
  end
end

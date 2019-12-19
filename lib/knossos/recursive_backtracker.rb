module Knossos
  module RecursiveBacktracker
    def carve(grid, start_at: grid.random_cell)
      stack = []
      stack.push start_at

      while stack.any?
        current = stack.last
        neighbors = grid.neighborhood(current).select { |n| n.links.empty? }

        if neighbors.empty?
          stack.pop
        else
          neighbor = neighbors.sample
          grid.build_passage(current, neighbor)
          stack.push(neighbor)
        end
      end

      grid
    end

    module_function :carve
  end
end

module Knossos
  module Algorithm
    class AldousBroder
      def initialize
        # nothing to do
      end

      def carve(grid:)
        cell = grid.random_cell
        unvisited = grid.cell_count - 1

        while unvisited > 0
          neighbor = grid.neighborhood(cell).sample

          if neighbor.links.empty?
            grid.build_passage(cell, neighbor)
            unvisited -= 1
          end

          cell = neighbor
        end

        grid
      end
    end
  end
end

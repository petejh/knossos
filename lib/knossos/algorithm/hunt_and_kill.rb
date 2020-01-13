module Knossos
  module Algorithm
    class HuntAndKill
      attr_reader :bias

      def initialize(**options)
        options = defaults.merge(options)
      end

      def carve(grid:)
        current = grid.random_cell

        while current
          unvisited_neighbors = grid.neighborhood(current).select { |n| n.links.empty? }

          if unvisited_neighbors.any?
            neighbor = unvisited_neighbors.sample
            grid.build_passage(current, neighbor)
            current = neighbor
          else
            current = nil

            grid.each_cell do |cell|
              visited_neighbors = grid.neighborhood(cell).select { |n| n.links.any? }
              if cell.links.empty? && visited_neighbors.any?
                current = cell

                neighbor = visited_neighbors.sample
                grid.build_passage(current, neighbor)

                break
              end
            end
          end
        end

        grid
      end

      private

      def defaults
        {}
      end
    end
  end
end

module Knossos
  module Solver
    class Dijkstra
      def initialize(grid:, start: nil, distances: nil)
        @start ||= grid[0, 0]
        @distances ||= Distances.new(root: @start)
      end

      def solve
        frontier = [@start]

        while frontier.any?
          new_frontier = []

          frontier.each do |cell|
            cell.links.each do |linked_cell|
              next if @distances[linked_cell]
              @distances[linked_cell] = @distances[cell] + 1
              new_frontier << linked_cell
            end
          end

          frontier = new_frontier
        end

        @distances
      end
    end
  end
end

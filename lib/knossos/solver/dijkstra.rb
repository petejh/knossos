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

      def path_to(goal:)
        current = goal

        path = Distances.new(root: @start)
        path[current] = @distances[current]
#        puts "path[current] = #{path[current]}"

        until current == @start
          current.links.each do |neighbor|
#            puts "@distances[neighbor] = #{@distances[neighbor]}"
            if @distances[neighbor] < @distances[current]
              path[neighbor] = @distances[neighbor]
              current = neighbor
              break
            end
          end
        end

        path
      end
    end
  end
end

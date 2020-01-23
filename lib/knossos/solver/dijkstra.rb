module Knossos
  module Solver
    class Dijkstra
      def initialize
        # nothing to do
      end

      def distances_from(start:)
        frontier = [start]
        distances = Distances.new(root: start)

        while frontier.any?
          new_frontier = []

          frontier.each do |cell|
            cell.links.each do |linked_cell|
              next if distances[linked_cell]
              distances[linked_cell] = distances[cell] + 1
              new_frontier << linked_cell
            end
          end

          frontier = new_frontier
        end

        distances
      end

      def shortest_path(start:, goal:, distances:)
        current = goal

        path = Distances.new(root: start)
        path[current] = distances[current]

        until current == start
          current.links.each do |neighbor|
            if distances[neighbor] < distances[current]
              path[neighbor] = distances[neighbor]
              current = neighbor
              break
            end
          end
        end

        path
      end

      def longest_path(distances:)
        # Find the cell that is furthest from any given starting cell. Then find
        # the cell that is furthest from that one. This is guaranteed to yield
        # the longest path in a perfect maze.

        new_start, _ = distances.max
        new_distances = distances_from(start: new_start)
        goal, _ = new_distances.max

        shortest_path(start: new_start, goal: goal, distances: new_distances)
      end
    end
  end
end

module Knossos
  module Algorithm
    class Wilsons
      def self.carve(grid:)
        unvisited = []
        grid.each_cell { |cell| unvisited << cell }

        unvisited.delete(unvisited.sample)
        while unvisited.any?
          cell = unvisited.sample
          path = [cell]

          while unvisited.include?(cell)
            cell = grid.neighborhood(cell).sample

            position = path.index(cell)
            if position
              path = path[0..position]
            else
              path << cell
            end
          end

          0.upto(path.length - 2) do |index|
            grid.build_passage(path[index], path[index + 1])
            unvisited.delete(path[index])
          end
        end

        grid
      end
    end
  end
end

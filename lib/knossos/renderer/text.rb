module Knossos
  module Renderer
    class Text
      def initialize
        # nothing to do
      end

      def render(grid:, distances: nil)
        output = "+" + "---+" * grid.columns + "\n"

        grid.each_row do |row|
          body = "|"
          bottom = "+"

          row.each do |cell|
            east = grid.east(cell)
            east_border = cell.linked?(east) ? " " : "|"

            south = grid.south(cell)
            south_border = cell.linked?(south) ? "   " : "---"

            body << decorate(cell, distances) << east_border
            bottom << south_border << "+"
          end

          output << body << "\n"
          output << bottom << "\n"
        end

        output
      end

      private

      def decorate(cell, distances)
        label = distances && distances[cell] ? distances[cell].to_s(36) : ' '
        " #{label} "
      end
    end
  end
end

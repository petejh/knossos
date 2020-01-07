module Renderer
  class Text
    def initialize
      # nothing to do
    end

    def render(grid:)
      output = "+" + "---+" * grid.columns + "\n"

      grid.each_row do |row|
        body = "|"
        bottom = "+"

        row.each do |cell|
          east = grid.east(cell)
          east_border = cell.linked?(east) ? " " : "|"

          south = grid.south(cell)
          south_border = cell.linked?(south) ? "   " : "---"

          body << "   " << east_border
          bottom << south_border << "+"
        end

        output << body << "\n"
        output << bottom << "\n"
      end

      output
    end
  end
end

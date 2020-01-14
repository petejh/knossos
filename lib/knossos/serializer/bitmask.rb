module Knossos
  module Serializer
    class Bitmask
      NORTH = 1
      EAST = 2
      SOUTH = 4
      WEST = 8

      def serialize(grid:)
        encoded_maze = Array.new(grid.columns) { Array.new(grid.rows, 0) }

        grid.each_row do |cells, row|
          cells.each_with_index do |cell, column|
            link_mask = 0

            cell.links.each do |link|
              link_mask |=
                case column <=> link.column
                when -1
                  EAST
                when 0
                  0
                when 1
                  WEST
                end

              link_mask |=
                case row <=> link.row
                when -1
                  SOUTH
                when 0
                  0
                when 1
                  NORTH
                end
              end

            encoded_maze[row][column] = link_mask
          end
        end

        encoded_maze
      end

      def deserialize(encoded_maze:)
        rows = encoded_maze.length
        columns = encoded_maze.first.length
        grid = Knossos::Grid.new({rows: rows, columns: columns})

        encoded_maze.each_with_index do |cells, row|
          cells.each_with_index do |cell, column|
            current_cell = grid[row, column]

            grid.build_passage(current_cell, grid[row - 1, column]) if (cell & NORTH > 0)
            grid.build_passage(current_cell, grid[row, column + 1]) if (cell & EAST > 0)
            grid.build_passage(current_cell, grid[row + 1, column]) if (cell & SOUTH > 0)
            grid.build_passage(current_cell, grid[row, column - 1]) if (cell & WEST > 0)
          end
        end

        grid
      end
    end
  end
end

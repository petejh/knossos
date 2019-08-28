require 'cell'

class Grid
  attr_reader :rows, :columns

  def initialize(args = {})
    args = defaults.merge(args)

    @rows = args[:rows]
    @columns = args[:columns]

    @grid = assemble_grid
  end

  def [](row, column)
    return nil unless row_is_valid?(row)
    return nil unless column_is_valid?(row, column)

    grid[row][column]
  end

  def neighborhood(cell)
    row = cell.row
    col = cell.column

    north = self[row - 1, col]
    south = self[row + 1, col]
    east = self[row, col + 1]
    west = self[row, col - 1]

    [north, east, south, west].compact
  end

  def cell_count
    grid.reduce(0) { |acc, e| acc += e.count }
  end

  private
  attr_accessor :grid

  def defaults
    { :rows => 10,
      :columns => 10
    }
  end

  def assemble_grid
    Array.new(@rows) do |row|
      Array.new(@columns) do |column|
        Cell.new({ :row => row, :column => column })
      end
    end
  end

  def row_is_valid?(row)
    row.between?(0, @rows - 1)
  end

  def column_is_valid?(row, column)
    column.between?(0, columns_for(row) - 1)
  end

  def columns_for(row)
    grid[row].count
  end
end

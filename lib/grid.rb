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

  def each_row
    grid.each_with_index { |cells, row| yield(cells, row) }
  end

  def each_cell
    each_row do |cells, row|
      cells.each_with_index { |cell, column| yield(cell, row, column) }
    end
  end

  def random_cell
    row = rand(rows)
    column = rand(columns_for(row))

    self[row, column]
  end

  def cell_count
    grid.reduce(0) { |acc, e| acc += e.count }
  end

  def north(cell)
    self[cell.row - 1, cell.column]
  end

  def east(cell)
    self[cell.row, cell.column + 1]
  end

  def south(cell)
    self[cell.row + 1, cell.column]
  end

  def west(cell)
    self[cell.row, cell.column - 1]
  end

  def neighborhood(cell)
    [:north, :east, :south, :west].map { |dir| self.send(dir, cell) }.compact
  end

  def build_passage(cell, other)
    cell.link_to(other)
    other.link_to(cell)
  end

  def to_s
    output = "+" + "---+" * columns + "\n"

    grid.each do |row|
      body = "|"
      bottom = "+"

      row.each do |cell|
        east = east(cell)
        east_border = cell.linked?(east) ? " " : "|"

        south = south(cell)
        south_border = cell.linked?(south) ? "   " : "---"

        body << "   " << east_border
        bottom << south_border << "+"
      end

      output << body << "\n"
      output << bottom << "\n"
    end

    output
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

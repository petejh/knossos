module BinaryTree
  def carve(grid)
    grid.each_cell do |cell|
      neighbors = []

      north = grid[cell.row - 1, cell.column]
      east = grid[cell.row, cell.column + 1]

      neighbors << north if north
      neighbors << east if east

      neighbor = neighbors.sample

      cell.link_to(neighbor) if neighbor
      neighbor.link_to(cell) if neighbor
    end

    grid
  end

  module_function :carve
end
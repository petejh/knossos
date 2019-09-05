module BinaryTree
  def carve(grid)
    grid.each_cell do |cell|
      neighbors = []

      north = grid.north(cell)
      neighbors << north if north

      east = grid.east(cell)
      neighbors << east if east

      neighbor = neighbors.sample
      grid.build_passage(cell, neighbor) if neighbor
    end

    grid
  end

  module_function :carve
end

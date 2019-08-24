class Cell
  attr_reader :row, :column
  attr_accessor :contents

  def initialize(args = {})
    args = defaults.merge(args)

    @row = args[:row]
    @column = args[:column]
    @contents = args[:contents]

    @neighbors = {}
  end

  def link_to(cell)
    @neighbors[cell] = true
  end

  def linked?(cell)
    @neighbors[cell] == true
  end

  def add_neighbor(cell)
    @neighbors[cell] = false unless @neighbors[cell]
    neighbors
  end

  def neighbors
    @neighbors.keys
  end

  private

  def defaults
    {}
  end
end

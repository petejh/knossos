require 'chunky_png'

class Image
  def initialize(width, height, color)
    @image = ChunkyPNG::Image.new(width, height, color)
  end

  def line(x0, y0, x1, y1, color)
    image.line(x0, y0, x1, y1, color)
  end

  def out
    image
  end

  private
  attr_accessor :image
end

module Color
  WHITE = ChunkyPNG::Color::WHITE
  BLACK = ChunkyPNG::Color::BLACK
end

class Display
  def initialize(grid, **options)
    options = defaults.merge(options)

    @grid = grid
    @cell_size = options[:cell_size]
    @background_color = options[:background_color]
    @wall_color = options[:wall_color]

    @image = create_canvas
  end

  def to_png
    grid.each_cell do |cell|
      x1, y1, x2, y2 = coordinates_for(cell)

      image.line(x1, y1, x2, y1, wall_color) unless grid.north(cell)
      image.line(x1, y1, x1, y2, wall_color) unless grid.west(cell)

      image.line(x2, y1, x2, y2, wall_color) unless cell.linked?(grid.east(cell))
      image.line(x1, y2, x2, y2, wall_color) unless cell.linked?(grid.south(cell))
    end

    image.out
  end

  private
  attr_reader :grid, :cell_size, :background_color, :wall_color
  attr_accessor :image

  def defaults
    { cell_size: 10,
      background_color: Color::WHITE,
      wall_color: Color::BLACK
    }
  end

  def create_canvas
    width = grid.columns * cell_size
    height = grid.rows * cell_size

    Image.new(width + 1, height + 1, background_color)
  end

  def coordinates_for(cell)
    x1 = cell_size * cell.column
    y1 = cell_size * cell.row

    x2 = cell_size * (cell.column + 1)
    y2 = cell_size * (cell.row + 1)

    [x1, y1, x2, y2]
  end
end

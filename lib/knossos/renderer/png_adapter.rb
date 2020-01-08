require 'chunky_png'

module Renderer
  module PNGAdapter
    class Image
      def initialize(width, height, color)
        @image = ChunkyPNG::Image.new(width, height, color)
      end

      def line(x0, y0, x1, y1, color)
        image.line(x0, y0, x1, y1, color)
      end

      def save(filename)
        image.save(filename)
      end

      private
      attr_accessor :image
    end

    module Color
      WHITE = ChunkyPNG::Color::WHITE
      BLACK = ChunkyPNG::Color::BLACK
    end
  end
end

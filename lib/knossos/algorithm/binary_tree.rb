module Knossos
  module Algorithm
    class BinaryTree
      attr_reader :bias

      def initialize(**options)
        options = defaults.merge(options)

        @bias = options[:bias]
      end

      def carve(seed = nil, grid:)
        srand(seed || Kernel.srand)

        grid.each_cell do |cell|
          neighbors = bias.map { |direction| grid.send(direction, cell) }.compact

          neighbor = neighbors.sample
          grid.build_passage(cell, neighbor) if neighbor
        end

        grid
      end

      private

      def defaults
        { bias: [:north, :east] }
      end
    end
  end
end

module Knossos
  module Algorithm
    class Sidewinder
      def self.carve(grid:)
        grid.each_row do |row|
          run = []
          row.each do |cell|
            run << cell

            if close_out_run?(grid, cell)
              member = run.sample

              north = grid.north(member)
              grid.build_passage(member, north) if north

              run.clear
            else
              east = grid.east(cell)
              grid.build_passage(cell, east)
            end
          end
        end

        grid
      end

      class << self
        private

        def close_out_run?(grid, cell)
          at_east_border?(grid, cell) || (!at_north_border?(grid, cell) && rand(2) == 0)
        end

        def at_east_border?(grid, cell)
          grid.east(cell).nil?
        end

        def at_north_border?(grid, cell)
          grid.north(cell).nil?
        end
      end
    end
  end
end

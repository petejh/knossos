class Sidewinder
  def self.carve(grid: grid)
    grid.each_row do |row|
      run = []
      row.each do |cell|
        run << cell

        if close_out_run?(grid, cell)
          member = run.sample

          north = grid[member.row - 1, member.column]
          grid.build_passage(member, north) if north
          run.clear
        else
          east = grid[cell.row, cell.column + 1]
          grid.build_passage(cell, east)
        end
      end
    end

    grid
  end

  private

  def self.close_out_run?(grid, cell)
    at_east_border?(grid, cell) || (!at_north_border?(grid, cell) && rand(2) == 0)
  end

  def self.at_east_border?(grid, cell)
    east = grid[cell.row, cell.column + 1]

    east.nil?
  end

  def self.at_north_border?(grid, cell)
    north = grid[cell.row - 1, cell.column]

    north.nil?
  end
end

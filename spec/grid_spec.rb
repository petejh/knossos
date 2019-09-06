require 'grid'

RSpec.describe 'Grid' do
  context 'when pristine' do
    before(:all) do
      @default_rows = 10
      @default_columns = 10
    end
    let(:grid) { Grid.new }

    it 'defaults to a sensible number of rows' do
      expect(grid.rows).to eq @default_rows
    end

    it 'defaults to a sensible number of columns' do
      expect(grid.columns).to eq @default_columns
    end

    it 'holds a grid of the default size' do
      expect(grid.cell_count).to eq (@default_rows * @default_columns)
    end
  end

  context 'when created with initial values' do
    before(:all) do
      @rows = 3
      @columns = 5
    end
    let(:grid) { Grid.new({:rows => @rows, :columns => @columns}) }

    it 'knows its rows' do
      expect(grid.rows).to eq @rows
    end

    it 'knows its columns' do
      expect(grid.columns).to eq @columns
    end

    it 'holds (rows × columns) cells' do
      expect(grid.cell_count).to eq (@rows * @columns)
    end
  end

  describe 'indexing using []' do
    let (:grid) { Grid.new }

    it 'locates a cell' do
      expect(grid[1, 2].column).to eq 2
    end

    it 'prevents underflow on rows' do
      expect(grid[-1, 1]).to be_nil
    end

    it 'prevents underflow on columns' do
      expect(grid[1, -1]).to be_nil
    end

    it 'prevents overflow on rows' do
      expect(grid[grid.rows, 1]).to be_nil
    end

    it 'prevents overflow on columns' do
      expect(grid[1, grid.columns]).to be_nil
    end
  end

  describe '#neighborhood' do
    let (:grid) { Grid.new }

    let (:nw_corner) { grid[0, 0] }

    let (:cell) { grid[1, 1] }
    let (:north) { grid[0, 1] }
    let (:south) { grid[2, 1] }
    let (:east) { grid[1, 2] }
    let (:west) { grid[1, 0] }

    it 'lists two neighbors for the NW corner cell' do
      expect(grid.neighborhood(nw_corner).count).to eq 2
    end

    it 'does not include nil in the neighborhood' do
      expect(grid.neighborhood(nw_corner)).not_to include nil
    end

    it 'lists the N neighbor' do
      expect(grid.neighborhood(cell)).to include north
    end

    it 'lists the E neighbor' do
      expect(grid.neighborhood(cell)).to include east
    end

    it 'lists the S neighbor' do
      expect(grid.neighborhood(cell)).to include south
    end

    it 'lists the W neighbor' do
      expect(grid.neighborhood(cell)).to include west
    end
  end

  describe '#to_s' do
    let(:grid) { Grid.new(args) }

    context 'with a single cell' do
      let(:args) { {:rows => 1, :columns => 1} }

      it 'displays a 1x1 grid' do
        grid_1x1 = <<~GRID
          +---+
          |   |
          +---+
        GRID

        expect(grid.to_s).to eq grid_1x1
      end
    end

    context 'with 3 rows and 3 columns' do
      let(:args) { {:rows => 3, :columns => 3} }

      it 'displays a 3x3 grid' do
        grid_3x3 = <<~GRID
          +---+---+---+
          |   |   |   |
          +---+---+---+
          |   |   |   |
          +---+---+---+
          |   |   |   |
          +---+---+---+
        GRID

        expect(grid.to_s).to eq grid_3x3
      end
    end
  end

  describe '#build_passage' do
    let(:grid) { Grid.new({rows: 3, columns: 3}) }

    it 'links two cells with a passage' do
      first = grid[1, 0]
      second = grid[1, 1]

      grid.build_passage(first, second)

      expect(first.linked?(second)).to be true
      expect(second.linked?(first)).to be true
    end
  end

  describe '#north' do
    let(:grid) { Grid.new({rows: 2, columns: 1}) }

    it 'returns nil when there is no neighbor to the north' do
      cell = grid[0, 0]

      expect(grid.north(cell)).to be_nil
    end

    it 'returns the neighbor to the north' do
      cell = grid[1, 0]
      north = grid[0, 0]

      expect(grid.north(cell)).to eq north
    end
  end

  describe '#east' do
    let(:grid) { Grid.new({rows: 1, columns: 2}) }

    it 'returns nil when there is no neighbor to the east' do
      cell = grid[0, 1]

      expect(grid.east(cell)).to be_nil
    end

    it 'returns the neighbor to the east' do
      cell = grid[0, 0]
      east = grid[0, 1]

      expect(grid.east(cell)).to eq east
    end
  end

  describe '#south' do
    let(:grid) { Grid.new({rows: 2, columns: 1}) }

    it 'returns nil when there is no neighbor to the south' do
      cell = grid[1, 0]

      expect(grid.south(cell)).to be_nil
    end

    it 'returns the neighbor to the south' do
      cell = grid[0, 0]
      south = grid[1, 0]

      expect(grid.south(cell)).to eq south
    end
  end

  describe '#west' do
    let(:grid) { Grid.new({rows: 1, columns: 2}) }

    it 'returns nil when there is no neighbor to the west' do
      cell = grid[0, 0]

      expect(grid.west(cell)).to be_nil
    end

    it 'returns the neighbor to the west' do
      cell = grid[0, 1]
      west = grid[0, 0]

      expect(grid.west(cell)).to eq west
    end
  end
end

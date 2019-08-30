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
        grid_1x1 = <<-GRID
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
        grid_3x3 = <<-GRID
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
end

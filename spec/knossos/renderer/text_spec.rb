RSpec.describe Renderer::Text do
  describe '#to_s' do
    let(:renderer) { Renderer::Text.new }
    let(:grid) { Knossos::Grid.new(args) }

    context 'with a single cell' do
      let(:args) { {:rows => 1, :columns => 1} }

      it 'displays a 1x1 grid' do
        grid_1x1 = <<~GRID
          +---+
          |   |
          +---+
        GRID

        expect(renderer.render(grid: grid)).to eq grid_1x1
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

        expect(renderer.render(grid: grid)).to eq grid_3x3
      end
    end
  end
end

RSpec.describe Knossos::Solver::Distances do
  let(:distances) { described_class.new(root: :root) }

  describe '#initialize' do
    # "Expect #new with keywords" requires RSpec ~> 3.9
#    it 'requires a `root` keyword argument' do
#      expect(described_class).to respond_to(:new).with_keywords(:root)
#    end
    it 'requires a `root` keyword argument' do
      expect{ described_class.new }.to raise_error(ArgumentError, /missing keyword/)
    end
  end

  describe '#[]' do
    context 'when pristine' do
      it 'has 0 for the root distance' do
        expect(distances[:root]).to equal(0)
      end
    end
  end

  describe '#[]=' do
    it 'sets the distance for the given cell' do
      distances[:root] = 3

      expect(distances[:root]).to equal(3)
    end
  end

  describe '#cells' do
    context 'when pristine' do
      it 'has only one cell' do
        expect(distances.cells.length).to equal(1)
      end
    end

    context 'with added cells' do
      it 'returns the cells' do
        distances[:some_cell] = 1

        expect(distances.cells).to include(:root, :some_cell)
      end

      it 'returns all of the cells' do
        expect{ distances[:some_cell] = 1 }.to change{ distances.cells.length }.by(1)
      end
    end
  end
end

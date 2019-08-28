require 'cell'

RSpec.describe 'Cell' do
  describe '#new' do
    context 'when pristine' do
      let(:cell) { Cell.new }

      it 'does not know its row' do
        expect(cell.row).to be_nil
      end

      it 'does not know its column' do
        expect(cell.column).to be_nil
      end

      it 'holds no contents' do
        expect(cell.contents).to be_nil
      end
    end

    context 'when created with initial values' do
      before(:each) do
        @args = {
          :row => 2,
          :column => 5,
          :contents => "rabbit"
        }
      end
      let(:cell) { Cell.new(@args) }

      it 'knows its row' do
        expect(cell.row).to eq @args[:row]
      end

      it 'knows its column' do
        expect(cell.column).to eq @args[:column]
      end

      it 'holds the specified contents' do
        expect(cell.contents).to eq @args[:contents]
      end
    end
  end

  describe '#link_to, #linked?' do
    let(:cell) { Cell.new }
    let(:other) { Cell.new }

    it 'is not linked to nil by default' do
      expect(cell.linked?(nil)).to be false
    end

    it 'can be linked to nil' do
      cell.link_to(nil)

      expect(cell.linked?(nil)).to be true
    end

    it 'can be linked to another cell' do
      cell.link_to(other)

      expect(cell.linked?(other)).to be true
    end
  end
end

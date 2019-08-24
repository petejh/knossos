require 'cell'

RSpec.describe 'Cell' do
  context 'when pristine' do
    before(:all) do
      @cell = Cell.new
    end

    it 'does not know its row' do
      expect(@cell.row).to be_nil
    end
    it 'does not know its column' do
      expect(@cell.column).to be_nil
    end
    it 'holds no contents' do
      expect(@cell.contents).to be_nil
    end
    it 'has no neighbors' do
      expect(@cell.neighbors).to be_empty
    end
  end

  context 'when created with initial values' do
    before(:all) do
      @args = {
        :row => 2,
        :column => 5,
        :contents => "rabbit"
      }

      @cell = Cell.new(@args)
    end

    it 'knows its row' do
      expect(@cell.row).to eq @args[:row]
    end

    it 'knows its column' do
      expect(@cell.column).to eq @args[:column]
    end

    it 'holds the specified contents' do
      expect(@cell.contents).to eq @args[:contents]
    end
  end

  context 'with neighbors' do
    before(:each) do
      @cell = Cell.new
      @unlinked_neighbor = Cell.new
      @linked_neighbor = Cell.new

      [@unlinked_neighbor, @linked_neighbor].each do |neighbor|
        @cell.add_neighbor(neighbor)
      end
      @cell.link_to(@linked_neighbor)
    end

    it 'knows its neighbors' do
      expect(@cell.neighbors).to include(@unlinked_neighbor, @linked_neighbor)
    end

    it 'recognizes a linked neighbor' do
      expect(@cell.linked?(@linked_neighbor)).to be true
    end

    it 'recognizes an unlinked neighbor' do
      expect(@cell.linked?(@unlinked_neighbor)).to be false
    end
  end

  context 'without neighbors' do
    before(:each) do
      @cell = Cell.new
      @other = Cell.new
    end

    it 'adds linked cells to its neighbors' do
      @cell.link_to(@other)

      expect(@cell.neighbors).to include @other
    end

    it 'does not automatically link its neighbors' do
      @cell.add_neighbor(@other)

      expect(@cell.linked?(@other)).to be false
    end
  end
end

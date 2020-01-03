require 'knossos/algorithm'

RSpec.describe Knossos::Algorithm do
  describe '.carve' do
    it 'responds to `carve`' do
      expect(described_class).to respond_to(:carve)
    end

    it 'requires a `grid` keyword argument' do
      expect(described_class).to respond_to(:carve).with_keywords(:grid)
    end
  end

  describe 'abstract interface' do
    let(:algorithm) { Class.new(described_class) }

    it 'requires subclasses to implement `carve`' do
      expect{ algorithm.carve(grid: nil) }.to raise_error(NotImplementedError)
    end
  end
end

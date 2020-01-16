RSpec.shared_examples 'algorithm' do
  describe '#carve' do
    let(:carver) { described_class.new }

    it 'responds to `carve`' do
      expect(carver).to respond_to(:carve)
    end

    it 'requires a `grid` keyword argument' do
      expect(carver).to respond_to(:carve).with_keywords(:grid)
    end

    it 'allows a `seed` keyword argument' do
      expect(carver).to respond_to(:carve).with_keywords(:grid, :seed)
    end
  end
end

RSpec.shared_examples 'algorithm' do
  describe '.carve' do
    it 'responds to `carve`' do
      expect(described_class).to respond_to(:carve)
    end

    it 'requires a `grid` keyword argument' do
      expect(described_class).to respond_to(:carve).with_keywords(:grid)
    end
  end
end

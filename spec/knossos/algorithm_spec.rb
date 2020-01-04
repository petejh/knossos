require 'knossos/algorithm/shared_examples_for_algorithm'

RSpec.describe Knossos::Algorithm do
  it_behaves_like 'algorithm'

  describe 'abstract interface' do
    let(:algorithm) { Class.new(described_class) }

    it 'requires subclasses to implement `carve`' do
      expect{ algorithm.carve(grid: nil) }.to raise_error(NotImplementedError)
    end
  end
end

require 'knossos/algorithm/shared_examples_for_algorithm'

RSpec.describe Knossos::Algorithm::BinaryTree do
  it_behaves_like 'algorithm'

  describe '.new' do
    let(:carver) { described_class.new(options) }

    context 'with no options passed' do
      let(:options) { {} }

      it 'has northeast bias' do
        expect(carver.bias).to include(:north, :east)
      end
    end

    context 'when provided options' do
      let(:options) { {bias: [:south, :west]} }

      it 'has the configured bias' do
        expect(carver.bias).to include(:south, :west)
      end
    end
  end

end

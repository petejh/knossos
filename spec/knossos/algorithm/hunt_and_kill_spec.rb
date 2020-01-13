require 'knossos/algorithm/shared_examples_for_algorithm'

RSpec.describe Knossos::Algorithm::HuntAndKill do
  it_behaves_like 'algorithm'

  describe '.new' do
    let(:carver) { described_class.new(options) }

    context 'with no options passed' do
      let(:options) { {} }

      it 'has no bias' do
        expect(carver.bias).to be_nil
      end
    end
  end
end

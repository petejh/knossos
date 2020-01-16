require 'knossos/algorithm/shared_examples_for_algorithm'

RSpec.describe Knossos::Algorithm::RecursiveBacktracker do
  it_behaves_like 'algorithm'

  let(:carver) { described_class.new }

  describe `#carve` do
    it 'allows a `start_at` keyword argument' do
      expect(carver).to respond_to(:carve).with_keywords(:grid, :start_at, :seed)
    end
  end
end

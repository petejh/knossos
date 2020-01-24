RSpec.describe Knossos::Solver::Dijkstra do
  let(:solver) { described_class.new }

  describe '#distances_from' do
    it 'requires a `start` keyword argument' do
      expect(solver).to respond_to(:distances_from).with_keywords(:start)
    end
  end

  describe '#shortest_path' do
    it 'requires `start`, `goal`, and `distances` keyword arguments' do
      expect(solver).to respond_to(:shortest_path).with_keywords(:start, :goal, :distances)
    end
  end

  describe '#longest_path' do
    it 'requires a `distances` keyword argument' do
      expect(solver).to respond_to(:longest_path).with_keywords(:distances)
    end
  end
end

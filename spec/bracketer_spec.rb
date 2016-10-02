module Neoclock
  describe Bracketer do
    it 'handles the easy case' do
      expect(described_class.new 2, 5).to eq [ 1, 2, 3 ]
    end

    it 'handles the low-end case' do
      expect(described_class.new 0, 5).to eq [ 0, 1, 4 ]
    end

    it 'handles the high-end case' do
      expect(described_class.new 4, 5).to eq [0, 3, 4]
    end
  end
end

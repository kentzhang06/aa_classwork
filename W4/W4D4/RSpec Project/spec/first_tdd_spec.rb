require 'first_tdd'

describe Array do
  describe "#uniq" do
    it "should remove duplicates from an array" do
      expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
    end
  end
  
  describe "#two_sum" do
    it "finds all pairs of positions who elements sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#transpose" do
    let(:array) {
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
    }

    let(:transposed) {
      [
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
        ]
    }

    it "switches the rows and columns of two-dimensional array" do
      expect(array.transpose).to eq(transposed)
    end
    it "all rows should be of equal length" do
      expect(transposed.all? { |row| row.length == transposed.first.length } ).to be true
    end
  end

  describe "#stock_picker" do
    # let(:prices) { [4, 6, 2, 7, 9, 1] }

    it "find the most profitable pair of days to buy then sell stock" do
      expect([4, 6, 2, 7, 9, 1].stock_picker).to eq([3, 4])
    end
  end
end
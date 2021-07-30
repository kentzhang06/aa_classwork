require 'towers_hanoi'

describe TowersHanoi do
  let(:tower) { TowersHanoi.new(3) }

  describe "#initialize" do
    it "creates an instance variable num_discs and sets to given arg" do
      expect(tower.num_discs).to eq(3)
    end

    it "creates instance variable for stacks of size 3" do
      expect(tower.stacks).to eq( [[3, 2, 1], [], []] )
    end

    it "creates instance variable for stacks of size 5" do
      tower5 = TowersHanoi.new(5)
      expect(tower5.stacks).to eq( [[5, 4, 3, 2, 1], [], []] )
    end


  end


  describe "#won?" do


    context "when all discs are in the final pile from largest to smallest" do
      it "should return true" do
        won_array = [3, 2, 1]

        tower.stacks[-1] = won_array
        expect(tower.won?).to eq(true)
      end
    end

    context "when all discs are not in the final pile in order of largest to smallest" do
      it "should return false" do
        expect(tower.won?).to eq(false)
      end
    end
  end

  describe "#move" do
    let(:tower_bad) { TowersHanoi.new(3) }
    it "should raise an error if from stack is empty" do
      expect { tower.move(1, 2) }.to raise_error("Can't move a disc from an empty stack")
    end
  end

  describe "#play" do
    it "calls on #won?" do
      expect(tower).to receive(:won?)
      tower.play
    end

    it "calls on #move?" do
      expect(tower).to receive(:move)
      tower.play
    end

  end
end

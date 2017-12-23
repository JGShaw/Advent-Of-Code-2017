require "defrag"

describe Defrag do
  context "Part one" do
    subject { Defrag.new }

    it "The count of the used squares matches the provided example" do
      expect(subject.count_used("flqrgnkx")).to eq 8108
    end

  end

end

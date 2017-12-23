require "defrag"

describe Defrag do
  subject { Defrag.new }
  context "Part one" do
    it "The count of the used squares matches the provided example" do
      expect(subject.count_used("flqrgnkx")).to eq 8108
    end
  end

  context "Part two" do
    it "The count of the groups matches the provided example" do
      expect(subject.count_groups("flqrgnkx")).to eq 1242
    end
  end

end

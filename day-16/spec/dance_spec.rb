require "dance"

describe Dance do
  subject { Dance.new }

  before(:each) do  
    @input = ["a", "b", "c", "d", "e"]
  end

  context "Part one" do
    it "The provided moves for part one can be exeucted correctly" do
      expect(subject.dance(@input, ["s1", "x3/4", "pe/b"])).to eq ["b", "a", "e", "d", "c"]
    end
  end

  context "Part two" do
    it "The provided moves can be executed lots" do
      expect(subject.dance_lots(2, @input, ["s1", "x3/4", "pe/b"])).to eq ["c", "e", "a", "d", "b"]
    end
  end
end

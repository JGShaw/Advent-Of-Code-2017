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

  context "Executing dance moves" do
    it "Can execute a spin move" do
      expect(subject.spin(@input, 3)).to eq ["c", "d", "e", "a", "b"]
    end

    it "Can execute an exchange move" do
      expect(subject.exchange(@input, 1, 3)).to eq ["a", "d", "c", "b", "e"]
    end

    it "Can execute a partner move" do
      expect(subject.partner(@input, "a", "d")).to eq ["d", "b", "c", "a", "e"]
    end
  end

end

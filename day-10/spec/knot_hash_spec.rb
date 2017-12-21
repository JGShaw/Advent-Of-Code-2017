require "knot_hash"

describe KnotHash do

  context "Simple hash" do
    subject { KnotHash.new 5 }
    it "The provided example gives the correct output for one length" do
      expect(subject.simple_hash [3]).to eq [2, 1, 0, 3, 4]
    end

    it "The provided example gives the correct output for two lengths" do
      expect(subject.simple_hash [3, 4]).to eq [4, 3, 0, 1, 2]
    end

    it "The provided example gives the correct output for three lengths" do
      expect(subject.simple_hash [3, 4, 1]).to eq [4, 3, 0, 1, 2]
    end

    it "The provided example gives the correct output for all lengths" do
      expect(subject.simple_hash [3, 4, 1, 5]).to eq [3, 4, 2, 1, 0]
    end
  end

  context "Complex hash" do
    subject { KnotHash.new 256 }
    it "Provided example: empty string" do
      expect(subject.complex_hash "").to eq "a2582a3a0e66e6e86e3812dcb672a272"
    end

    it "Provided example: AoC 2017" do
      expect(subject.complex_hash "AoC 2017").to eq "33efeb34ea91902bb2f59c9920caa6cd"
    end

    it "Provided example: 1,2,3" do
      expect(subject.complex_hash "1,2,3").to eq "3efbe78a8d82f29979031a4aa0b16a9d"
    end

    it "Provided example: 1,2,4" do
      expect(subject.complex_hash "1,2,4").to eq "63960835bcdc130f0b66d7ff4f6a5a8e"
    end

    it "Can convert from a string to an array of ascii values" do
      expect(subject.ascii_to_ints "1,2,3").to eq [49, 44, 50, 44, 51]
    end

    it "Can append a constant suffix to an input" do
      expect(subject.append_suffix [49, 44, 50, 44, 51]).to eq [49, 44, 50, 44, 51, 17, 31, 73, 47, 23]
    end

    it "Can create a dense hash" do
      expect(subject.create_dense_hash(4, (1..16).to_a)).to eq [4, 12, 4, 28]
    end

    it "Can convert a list of integers to hex output" do
      expect(subject.ints_to_hex [64, 7, 255]).to eq "4007ff"
    end

  end

end

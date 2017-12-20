require "knot_hash"

describe KnotHash do
  subject { KnotHash.new 5 }

  it "The provided example gives the correct output for one length" do
    expect(subject.hash [3]).to eq [2, 1, 0, 3, 4]
  end

  it "The provided example gives the correct output for two lengths" do
    expect(subject.hash [3, 4]).to eq [4, 3, 0, 1, 2]
  end

  it "The provided example gives the correct output for three lengths" do
    expect(subject.hash [3, 4, 1]).to eq [4, 3, 0, 1, 2]
  end

  it "The provided example gives the correct output for all lengths" do
    expect(subject.hash [3, 4, 1, 5]).to eq [3, 4, 2, 1, 0]
  end

end

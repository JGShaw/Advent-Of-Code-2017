require "hex_grid"

describe HexGrid do
  subject { HexGrid.new }

  it "3 constant moves gives a distance of 3" do
    expect(subject.distance_moved(["ne", "ne", "ne"])[0]).to eq 3
  end

  it "Moving bask to the start location has a distance of 0" do
    expect(subject.distance_moved(["ne", "ne", "sw", "sw"])[0]).to eq 0
  end

  it "NE twice, then S twice gives a distance of 2" do
    expect(subject.distance_moved(["ne", "ne", "s", "s"])[0]).to eq 2
  end

  it "final provided example gives a distance of 3" do
    expect(subject.distance_moved(["se","sw","se","sw","sw"])[0]).to eq 3
  end

end

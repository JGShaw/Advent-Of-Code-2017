require "search"

describe Search do
  subject { Search.new }
  
  it "count_connected works correctly for the part one example" do
    input = ["0 <-> 2",
            "1 <-> 1",
            "2 <-> 0, 3, 4",
            "3 <-> 2, 4",
            "4 <-> 2, 3, 6",
            "5 <-> 6",
            "6 <-> 4, 5"]
    expect(subject.count_connected("0", input)).to eq 6
  end

end

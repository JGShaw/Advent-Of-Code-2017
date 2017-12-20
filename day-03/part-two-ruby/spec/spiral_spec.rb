require "spiral"

describe Spiral do
  subject { Spiral.new }
 
  it "The first value larger than 12 is 23" do
    expect(subject.first_value_larger_than 12).to eq 23
  end

  it "The first value larger than 25 is 26" do
    expect(subject.first_value_larger_than 25).to eq 26
  end
  
  it "The first value larger than 70 is 122" do
    expect(subject.first_value_larger_than 70).to eq 122
  end

  it "The first value larger than 200 is 304" do
    expect(subject.first_value_larger_than 200).to eq 304
  end
  
  it "The first value larger than 800 is 806" do
    expect(subject.first_value_larger_than 800).to eq 806
  end
end

require "bucket"

describe Bucket do
  subject { Bucket.new 5 }

  it "Constructor stores the value of the bucket" do
    expect(subject.value).to eq 5
  end

  it "Emptying the bucket returns its contents" do
    expect(subject.empty).to eq 5
  end

  it "Emptying the bucket results in the bucket being empty" do
    subject.empty
    expect(subject.value).to eq 0
  end

  it "Can increase the value of a bucket" do
    subject.increase 
    expect(subject.value).to eq 6
  end

end

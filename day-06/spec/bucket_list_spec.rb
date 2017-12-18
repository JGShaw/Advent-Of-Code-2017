require "bucket_list"

describe BucketList do
  subject { BucketList.new [0,2,7,0] }

  it "Constructor creates buckets with the values from the list" do
    expect(subject.buckets[0].value).to eq 0
    expect(subject.buckets[1].value).to eq 2
    expect(subject.buckets[2].value).to eq 7
    expect(subject.buckets[3].value).to eq 0
  end

  it "Redistribute works correct on the max bucket" do
    subject.redistribute
    expect(subject.buckets[0].value).to eq 2
    expect(subject.buckets[1].value).to eq 4
    expect(subject.buckets[2].value).to eq 1
    expect(subject.buckets[3].value).to eq 2
  end

  it "Can convert a list of buckets to a string" do
    expect(subject.stringify).to eq "|0|2|7|0|"
  end

  it "Can count the moves to a cycle" do
    expect(subject.count_moves_to_cycle).to eq 5
  end
end

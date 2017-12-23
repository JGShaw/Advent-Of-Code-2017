require "moves"

describe Spin do
  subject { Spin.new("s3") }
  it "Can execute a spin move" do
    expect(subject.execute(["a", "b", "c", "d", "e"])).to eq ["c", "d", "e", "a", "b"]
  end
end

describe Exchange do
  subject { Exchange.new("x1/3") }
  it "Can execute an exchange move" do
    expect(subject.execute(["a", "b", "c", "d", "e"])).to eq ["a", "d", "c", "b", "e"]
  end
end


describe Partner do
  subject { Partner.new("pa/d") }
  it "Can execute an exchange move" do
    expect(subject.execute(["a", "b", "c", "d", "e"])).to eq ["d", "b", "c", "a", "e"]
  end
end

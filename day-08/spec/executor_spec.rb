require "executor"

describe Executor do
  subject { Executor.new }

  it "Can correctly execute a series of lines and give back the correct registers" do
    lines = ["b inc 5 if a > 1", "a inc 1 if b < 5", "c dec -10 if a >= 1", "c inc -20 if c == 10"]
    result = subject.execute(lines)
    expect(result["a"]).to eq(1)
    expect(result["b"]).to eq(0)
    expect(result["c"]).to eq(-10)
  end

  it "Stores the maximum register value through execution" do
    lines = ["b inc 5 if a > 1", "a inc 1 if b < 5", "c dec -10 if a >= 1", "c inc -20 if c == 10"]
    subject.execute(lines)
    expect(subject.highestRegisterValue).to eq(10)
  end

end

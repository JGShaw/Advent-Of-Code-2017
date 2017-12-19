require "instruction"

describe Instruction do
  subject { Instruction.new "b inc 5 if a > 1" }
  
  it "Can read an opRegister" do
    expect(subject.opRegister).to eq "b"
  end
 
  it "Can read an opAction" do
    expect(subject.opAction).to eq "inc"
  end

  it "Can read an opValue" do
    expect(subject.opValue).to eq 5
  end
  
  it "Can read a condRegister" do
    expect(subject.condRegister).to eq "a"
  end
  
  it "Can read a condOperator" do
    expect(subject.condOperator).to eq ">"
  end
  
  it "Can read a condValue" do
    expect(subject.condValue).to eq 1
  end

end

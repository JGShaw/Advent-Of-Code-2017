require "program"

describe Program do
  subject { Program.new("ABCD", 10) }

  it "Constructor stores the name of the program" do
    expect(subject.name).to eq "ABCD"
  end

  it "Constructor stores the weight of the program" do
    expect(subject.weight).to eq 10
  end

  it "Constructor sets up and empty list of subprograms" do
    expect(subject.subprograms).to eq []
  end

  it "Adding a subprogram adds it to the subprogram list" do 
    subprogram = Program.new("EFGH", 20)
    subject.add_subprogram(subprogram)
    expect(subject.subprograms).to contain_exactly subprogram
  end

  it "Adding a subprogram sets the parent in the child" do 
    subprogram = Program.new("EFGH", 20)
    subject.add_subprogram(subprogram)
    expect(subprogram.parent).to eq subject
  end
end

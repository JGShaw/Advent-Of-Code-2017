require "program"

describe Program do
  subject { Program.new("A", 10) }

  it "Constructor stores the name of the program" do
    expect(subject.name).to eq "A"
  end

  it "Constructor stores the weight of the program" do
    expect(subject.weight).to eq 10
  end

  it "Constructor sets up and empty list of subprograms" do
    expect(subject.subprograms).to eq []
  end

  it "Adding a subprogram adds it to the subprogram list" do 
    subprogram = Program.new("B", 20)
    subject.add_subprogram(subprogram)
    expect(subject.subprograms).to contain_exactly subprogram
  end

  it "Adding a subprogram sets the parent in the child" do 
    subprogram = Program.new("B", 20)
    subject.add_subprogram(subprogram)
    expect(subprogram.parent).to eq subject
  end

  it "When holding is called on a program with no subprograms its weight is returned" do
    expect(subject.holding).to eq 10
  end

  it "Can calculate the total weight a program is holding" do
    subject.add_subprogram(Program.new("B", 20))
    c = Program.new("C", 30)
    subject.add_subprogram(c)
    c.add_subprogram(Program.new("D", 40))
    expect(subject.holding).to eq 100
  end

end

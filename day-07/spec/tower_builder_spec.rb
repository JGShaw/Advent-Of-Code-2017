require "tower_builder"
require "program"

describe TowerBuilder do
  subject { TowerBuilder.new }

  before(:each) do
    @lines = []
    @lines.push("pbga (66)")
    @lines.push("xhth (57)")
    @lines.push("ebii (61)")
    @lines.push("havc (66)")
    @lines.push("ktlj (57)")
    @lines.push("fwft (72) -> ktlj, cntj, xhth")
    @lines.push("qoyq (66)")
    @lines.push("padx (45) -> pbga, havc, qoyq")
    @lines.push("tknk (41) -> ugml, padx, fwft")
    @lines.push("jptl (61)")
    @lines.push("ugml (68) -> gyxo, ebii, jptl")
    @lines.push("gyxo (61)")
    @lines.push("cntj (57)")
  end

  it "Can take a series of lines and find the correct root" do
    expect(subject.find_root @lines).to eq "tknk"
  end

  it "Can extract the program name" do
    expect(subject.extract_name "fwft (72) -> ktlj, cntj, xhth").to eq "fwft"
  end


  it "Can extract the program weight" do
    expect(subject.extract_weight "fwft (72) -> ktlj, cntj, xhth").to eq 72
  end

  it "Can extract the program name" do
    expect(subject.extract_subprograms "fwft (72) -> ktlj, cntj, xhth").to contain_exactly("ktlj", "cntj", "xhth")
  end

  it "Can work out the valued that needs to be added to balance the tower" do
    root = subject.find_root(@lines)
    expect(subject.weight_needed_to_balance root).to eq 8
  end

  it "adding subprograms sets the subprogram list correctly" do
    a = Program.new("A", 10)
    b = Program.new("B", 10)
    c = Program.new("C", 10)
    programs = {"A" => a, "B" => b, "C" => c}
    subprograms = {"A" => ["B", "C"]}
    subject.build_tree(programs, subprograms)
    expect(a.subprograms).to contain_exactly(b, c)
  end

  it "adding subprograms sets their parents correctly" do
    a = Program.new("A", 10)
    b = Program.new("B", 10)
    c = Program.new("C", 10)
    programs = {"A" => a, "B" => b, "C" => c}
    subprograms = {"A" => ["B", "C"]}
    subject.build_tree(programs, subprograms)
    expect(b.parent).to eq a
    expect(c.parent).to eq a
  end


end

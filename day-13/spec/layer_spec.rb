require "layer"

describe Layer do
  context "Creating a layer with a scanner" do
    subject { Layer.new(2, 3) }  

    it "The scanner starts at position zero" do
      expect(subject.scannerPos).to eq 0
    end

    it "After one tick the scanner has moved down one position" do
      subject.tick
      expect(subject.scannerPos).to eq 1
    end

    it "After two ticks the scanner is the lowest it can go" do
      subject.tick
      subject.tick
      expect(subject.scannerPos).to eq 2
    end

    it "After three ticks the scanner starts to move back up" do
      subject.tick
      subject.tick
      subject.tick
      expect(subject.scannerPos).to eq 1
    end

    it "The scanner position can go down after going up" do 
      subject.tick 
      subject.tick #bottom
      subject.tick 
      subject.tick #top
      subject.tick 
      expect(subject.scannerPos).to eq 1
    end

    it "The severity can of being caught at this layer is calculated correctly" do
      expect(subject.severity).to eq 6
    end

    it "Can convert the layer to a string" do
      expect(subject.to_s).to eq "L: 2, SP: 0, MD: 2, SEV: 6"
    end
  end

  context "Creating a layer with no scanner" do
    subject { Layer.new 2 }
     
    it "The severity is zero" do
      expect(subject.severity).to eq 0
    end
  end

end

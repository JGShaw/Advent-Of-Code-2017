require "firewall"

describe Firewall do
  subject { Firewall.new }  

  it "Output matches for the given example" do
    expect(subject.trip_severity(["0: 3", "1: 2", "4: 4", "6: 4"])).to eq 24
  end

end

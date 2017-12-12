require "spec_helper"

RSpec.describe PaintCli::Shapes::Line do
  let(:line) { described_class.new(x1: 1, y1: 1, x2: 1, y2: 3) }

  describe ".from_input" do
    it "returns a line for the given input" do
      expect(described_class.from_input(["1","1","1","3"])).to eq(described_class.new(x1: 1, y1: 1, x2: 1, y2: 3))
    end

    it "returns invalid input if the input is not recognized" do
      expect(described_class.from_input(["1", "1"])).to be_an_instance_of(PaintCli::InvalidInput)
    end
  end

  it "returns the pixels for a line" do
    expect(line.pixels).to eq([1, 1]=>"x", [1, 2]=>"x", [1, 3]=>"x")
  end
end

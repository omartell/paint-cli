require "spec_helper"

RSpec.describe PaintCli::Shapes::Rectangle do
  describe ".from_input" do
    context "a valid input" do
      it "parses a rectangle for the given input" do
        expect(described_class.from_input(["1", "1", "3", "3"])).to eq(
          described_class.new(x1: 1, y1: 1, x2: 3, y2: 3)
        )
      end
    end

    context "invalid input" do
      it "returns invalid input for unrecognized input" do
        expect(described_class.from_input(["a", "1", "3", "3"])).to be_an_instance_of(
          PaintCli::InvalidInput
        )
      end
    end
  end

  it "returns the pixels for the given coordinates" do
    expect(described_class.new(x1: 1, y1: 1, x2: 3, y2: 3).pixels).to eq(
      [1, 1] => "x",
      [1, 2] => "x",
      [1, 3] => "x",
      [2, 1] => "x",
      [2, 3] => "x",
      [3, 1] => "x",
      [3, 2] => "x",
      [3, 3] => "x"
    )
  end
end

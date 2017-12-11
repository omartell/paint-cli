require "spec_helper"

RSpec.describe PaintCli::Parser do
  let(:parser) { described_class.new }

  context "valid commands" do
    it "parses a quit command" do
      expect(parser.parse("Q")).to be_an_instance_of(PaintCli::Quit)
    end

    it "parses a canvas command" do
      expect(parser.parse("C 3 3")).to eq(PaintCli::Shapes::Canvas.new(width: 3, height: 3))
    end

    it "parses a line command" do
      expect(parser.parse("L 1 1 1 3")).to eq(PaintCli::Shapes::Line.new(x1: 1, y1: 1, x2: 1, y2: 3))
    end
  end

  context "invalid commands" do
    it "returns invalid input for invalid width and height" do
      expect(parser.parse("C a f")).to be_an_instance_of(PaintCli::InvalidInput)
    end

    it "returns invalid input for unrecognized commands" do
      expect(parser.parse("I")).to be_an_instance_of(PaintCli::InvalidInput)
    end
  end
end

require "spec_helper"

RSpec.describe PaintCli::Parser do
  let(:parser) { described_class.new }

  context "valid commands" do
    it "parses a quit command" do
      expect(parser.parse("Q")).to eq(PaintCli::Quit.new)
    end

    it "parses a canvas command" do
      expect(parser.parse("C 3 3")).to eq(PaintCli::Canvas.new(width: 3, height: 3))
    end
  end

  context "invalid commands" do
    it "returns invalid input for invalid width and height" do
      expect(parser.parse("C a f")).to eq(PaintCli::InvalidInput.new(input: "C a f"))
    end

    it "returns invalid input for unrecognized commands" do
      expect(parser.parse("I")).to eq(PaintCli::InvalidInput.new(input: "I"))
    end
  end
end

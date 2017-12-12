require "spec_helper"

RSpec.describe PaintCli::Shapes::Line do
  let(:line) { described_class.new(x1: 1, y1: 1, x2: 1, y2: 3) }

  it "returns the pixels for a line" do
    expect(line.pixels).to eq({[1, 1]=>"x", [1, 2]=>"x", [1, 3]=>"x"})
  end
end

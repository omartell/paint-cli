require "spec_helper"

RSpec.describe PaintCli::Shapes::Canvas do
  let(:canvas) { described_class.new(width: 3, height: 3) }

  describe ".from_input" do
    it "returns a canvas for the given input" do
      expect(described_class.from_input(["3" "3"])).to eq(described_class.new(width: 3, height: 3))
    end

    it "return invalid input if the input is not recognized" do
      expect(described_class.from_input(["a" "b"])).to be_an_instance_of(PaintCli::InvalidInput)
    end
  end

   it "returns the pixels for the canvas" do
     expect(canvas.pixels).to eq({
       width:  3,
       height: 3,
       [1, 1] => nil,
       [1, 2] => nil,
       [1, 3] => nil,
       [2, 1] => nil,
       [2, 2] => nil,
       [2, 3] => nil,
       [3, 1] => nil,
       [3, 2] => nil,
       [3, 3] => nil
     })
   end
end

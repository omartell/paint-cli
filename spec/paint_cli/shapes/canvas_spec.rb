require "spec_helper"

RSpec.describe PaintCli::Shapes::Canvas do
  let(:canvas) { described_class.new(width: 3, height: 3) }

   it "returns the pixels for the canvas" do
     expect(canvas.pixels).to eq({
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

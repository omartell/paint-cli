require "spec_helper"

RSpec.describe PaintCli do
  it "has a version number" do
    expect(PaintCli::VERSION).not_to be nil
  end
end

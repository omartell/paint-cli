require 'spec_helper'

RSpec.describe PaintCli::Runner do
  let(:runner) { described_class.new }

  it "is able to run the application and quit" do
    allow($stdin).to receive(:gets).and_return("Q")

    expect { runner.start }.to output(%r{Welcome to paint-cli}).to_stdout
  end

  it "is able to handle canvas commands" do
    allow($stdin).to receive(:gets).and_return("C 3 3", "Q")

    expect { runner.start }.to output(%r{
|---|
|   |
|   |
|   |
|---|
}x).to_stdout
  end
end

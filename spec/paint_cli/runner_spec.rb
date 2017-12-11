require 'spec_helper'

RSpec.describe PaintCli::Runner do
  let(:runner) { described_class.new }

  def message(s)
    Regexp.new(Regexp.escape(s))
  end

  it "is able to run the application and quit" do
    allow($stdin).to receive(:gets).and_return("Q")

    expect { runner.start }.to output(%r{Welcome to paint-cli}).to_stdout
  end

  it "paints a canvas" do
    allow($stdin).to receive(:gets).and_return("C 3 3", "Q")

    expect { runner.start }.to output(message(<<-OUT)).to_stdout
|---|
|   |
|   |
|   |
|---|
OUT
  end

  it "paints horizontal lines" do
    allow($stdin).to receive(:gets).and_return("C 3 3", "L 1 1 1 3", "Q")

    expect { runner.start }.to output(message(<<-OUT)).to_stdout
|---|
|x  |
|x  |
|x  |
|---|
OUT
  end

  it "shows an error message for invalid inputs" do
    allow($stdin).to receive(:gets).and_return("C a f", "Q")

    expect { runner.start }.to output(%r{Invalid input, please try again}).to_stdout
  end
end

class PaintCli::InvalidInput
  attr_reader :input
  def initialize(input)
    @input = input
  end
end

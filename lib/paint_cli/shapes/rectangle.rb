class PaintCli::Shapes::Rectangle < OpenStruct
  def self.from_input(input)
    self.new(
      x1: Integer(input[0]),
      y1: Integer(input[1]),
      x2: Integer(input[2]),
      y2: Integer(input[3])
    )
  rescue ArgumentError, TypeError
    PaintCli::InvalidInput.new(input: input)
  end
end

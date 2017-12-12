class PaintCli::Shapes::Rectangle < OpenStruct
  attr_reader :x1, :y1, :x2, :y2

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

  def initialize(x1:, y1:, x2:, y2:)
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
  end

  def pixels
    PaintCli::Shapes::Line.new(x1: x1, y1: y1, x2: x1, y2: y2).pixels
      .merge(
      PaintCli::Shapes::Line.new(x1: x1, y1: y1, x2: x2, y2: y1).pixels
    ).merge(
      PaintCli::Shapes::Line.new(x1: x2, y1: y2, x2: x2, y2: y1).pixels
    ).merge(
      PaintCli::Shapes::Line.new(x1: x2, y1: y2, x2: x1, y2: y2).pixels
    )
  end
end

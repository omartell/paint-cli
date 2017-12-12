module PaintCli::Shapes
  class Line < OpenStruct
    attr_reader :x1, :y1, :x2, :y2

    def self.from_input(input)
      x1 = Integer(input[0])
      y1 = Integer(input[1])
      x2 = Integer(input[2])
      y2 = Integer(input[3])
      self.new(x1: x1, y1: y1, x2: x2, y2: y2)
    rescue ArgumentError, TypeError
      PaintCli::InvalidInput.new(input: input)
    end

    def initialize(x1:, y1:, x2:, y2:)
      @x1, @y1, @x2, @y2 = x1, y1, x2, y2
    end

    def pixels
      by_y = y2 > y1 ? 1 : -1
      by_x = x2 > x1 ? 1 : -1
      Hash[
        x1.step(by: by_x, to: x2).flat_map { |x|
          y1.step(by: by_y, to: y2).map {|y| [[x, y], "x"]}
        }
      ]
    end
  end
end

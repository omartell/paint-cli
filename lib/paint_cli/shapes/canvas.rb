require 'ostruct'

module PaintCli::Shapes
  class Canvas < OpenStruct
    attr_reader :width, :height

    def self.from_input(input)
      width  = Integer(input.first)
      height = Integer(input.last)
      self.new(width: width, height: height)
    end

    def initialize(width: , height:)
      @width  = width
      @height = height
    end

    def pixels
      Hash[
        (1..width).flat_map do |x|
          (1..height).map do |y|
            [[x, y], nil]
          end
        end
      ]
    end
  end
end

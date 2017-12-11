require 'ostruct'

module PaintCli
  class Quit
  end

  class InvalidInput
    attr_reader :input
    def initialize(input)
      @input = input
    end
  end

  class Parser
    def parse(input)
      command, *args = input.split(/\s/)

      case command
      when "Q"
        Quit.new
      when "C"
        PaintCli::Shapes::Canvas.from_input(args)
      when "L"
        PaintCli::Shapes::Line.from_input(args)
      else
        InvalidInput.new(input: input)
      end
    rescue ArgumentError
      InvalidInput.new(input: input)
    end
  end
end

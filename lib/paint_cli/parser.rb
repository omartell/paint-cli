require 'ostruct'

module PaintCli
  class Quit
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
        PaintCli::InvalidInput.new(input: input)
      end
    end
  end
end

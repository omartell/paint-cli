require 'ostruct'

module PaintCli
  class Quit < OpenStruct
    def run
    end
  end

  class InvalidInput < OpenStruct
    def run
      $stdout.puts "Invalid input, please try again"
    end
  end

  class Canvas < OpenStruct
    def run
      puts "|"  + "-" * width + "|"
      height.times do
        puts "|"  + " " * width + "|"
      end
      puts "|"  + "-" * width + "|"
    end
  end

  class Line < OpenStruct
    def run
    end
  end

  class Parser
    def parse(input)
      command, *args = input.split(/\s/)

      case command
      when "Q"
        Quit.new
      when "C"
        width  = Integer(args.first)
        height = Integer(args.last)
        Canvas.new(width: width, height: height)
      when "L"
        x1 = Integer(args[0])
        y1 = Integer(args[1])
        x2 = Integer(args[2])
        y2 = Integer(args[3])
        Line.new(x1: x1, y1: y1, x2: x2, y2: y2)
      else
        InvalidInput.new(input: input)
      end
    rescue ArgumentError
      InvalidInput.new(input: input)
    end
  end
end

module PaintCli
  class Quit
    def run
    end
  end

  class Canvas
    attr_reader :width, :height
    def initialize(width, height)
      @width  = width
      @height = height
    end

    def run
      puts "|"  + "-" * width + "|"
      height.times do
        puts "|"  + " " * width + "|"
      end
      puts "|"  + "-" * width + "|"
    end
  end

  class Parser
    def parse(input)
      command, *args = input.split(/\s/)

      if command == "Q"
        Quit.new
      elsif command == "C"
        width  = Integer(args.first)
        height = Integer(args.last)
        Canvas.new(width, height)
      end
    end
  end
end

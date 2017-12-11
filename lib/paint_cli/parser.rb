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
      else
        InvalidInput.new(input: input)
      end
    rescue ArgumentError
      InvalidInput.new(input: input)
    end
  end
end

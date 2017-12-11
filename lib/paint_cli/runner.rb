module PaintCli
  class Runner
    def start
      parser = Parser.new
      screen = Screen.new
      $stdout.puts "Welcome to paint-cli"
      loop  do
        $stdout.puts "Insert your command:"
        input   = $stdin.gets.chomp
        command = parser.parse(input)

        case command
        when Quit
          break
        when InvalidInput
          $stdout.puts "Invalid input, please try again"
        when PaintCli::Shapes::Canvas
          width, height = command.width, command.height
          screen.paint(width, height, command.pixels)
        else
          screen.paint(width, height, command.pixels)
        end
      end
    end
  end
end

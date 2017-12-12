module PaintCli
  class Runner
    def start
      parser = Parser.new
      screen = Screen.new
      pixels = {}
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
        else
          screen.paint(pixels.merge!(command.pixels))
        end
      end
    end
  end
end

module PaintCli
  class Runner
    def start
      parser = Parser.new
      loop  do
        $stdout.puts "Welcome to paint-cli"
        $stdout.puts "Insert your command"
        input  = $stdin.gets.chomp
        command = parser.parse(input)

        case command
        when Quit
          break
        else
          command.run
        end
      end
    end
  end
end

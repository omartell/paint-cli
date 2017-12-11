class PaintCli::Screen
  def paint(width, height, pixels)
    puts "|"  + "-" * width + "|"
    height.times do
      puts "|"  + " " * width + "|"
    end
    puts "|"  + "-" * width + "|"
  end
end

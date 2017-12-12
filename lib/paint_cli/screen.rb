class PaintCli::Screen
  def paint(pixels)
    pixels = pixels.dup
    width  = pixels.delete(:width)
    height = pixels.delete(:height)
    puts "|" + "-" * width + "|"

    pixels.
      sort { |((x1, y1), _v1), ((x2, y2), _v2)| [y1, x1] <=> [y2, x2] }.
      each_slice(width).
      map { |s| s.map { |(_k, v)| v || " " } }.
      each { |s| puts "|" + s.join("") + "|" }

    puts "|" + "-" * width + "|"
  end
end

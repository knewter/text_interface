class CanvasPrinter
  attr_reader :canvas

  def initialize(canvas)
    @canvas = canvas
  end

  def print
    @canvas.lines.map{ |line| line.join('') }.join("\n")
  end
end

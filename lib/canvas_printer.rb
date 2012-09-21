class CanvasPrinter
  attr_reader :canvas

  def initialize(canvas)
    @canvas = canvas
  end

  def print
    ''.tap do |output|
      @canvas.lines.each do |line|
        output << line.join('')
        output << "\n" unless @canvas.lines.last == line
      end
    end
  end
end

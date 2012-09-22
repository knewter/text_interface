class CanvasStitcher
  def initialize(input_canvas, output_canvas, x, y)
    @input_canvas  = input_canvas
    @output_canvas = output_canvas
    @x = x
    @y = y
  end

  def execute!
    @input_canvas.lines.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        @output_canvas.set_cell_at(@x + x, @y + y, cell)
      end
    end
  end
end

class CanvasCreator
  def initialize(text, canvas_class, default_cell)
    @lines = []
    text.each_line do |text_line|
      line = []
      stripped_text_line = text_line[0..-2] # Remove the newline at the end of the line
      stripped_text_line.each_char do |c|
        line << c
      end
      @lines << line
    end
    @canvas = canvas_class.new(@lines.first.length, @lines.length, default_cell)
  end

  def generate_canvas
    @lines.each_with_index do |line, y|
      line.each_with_index do |cell, x|
        @canvas.set_cell_at(x, y, cell)
      end
    end
  end
end

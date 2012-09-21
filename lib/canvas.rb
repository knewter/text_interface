class Canvas
  attr_reader :lines

  def initialize(width, height, default_cell)
    @lines  = []
    height.times do
      line = []
      width.times do
        line << default_cell.call
      end
      lines << line
    end
  end

  def cell_at(x, y)
    line_at(x)[y]
  end

  def line_at(x)
    lines[x]
  end
end

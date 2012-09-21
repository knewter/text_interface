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
    line_at(y)[x]
  end

  def line_at(y)
    lines[y]
  end

  def set_cell_at(x, y, val)
    line_at(y)[x] = val
  end
end

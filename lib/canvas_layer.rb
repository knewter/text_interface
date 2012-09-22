class CanvasLayer
  attr_reader :x, :y

  def initialize(canvas, x, y)
    @canvas = canvas
    @x = x
    @y = y
  end

  def move_left(distance)
    @x -= distance
  end

  def move_right(distance)
    @x += distance
  end

  def move_up(distance)
    @y -= distance
  end

  def move_down(distance)
    @y += distance
  end

  def canvas
    if @canvas.respond_to?(:call)
      @canvas.call
    else
      @canvas
    end
  end
end

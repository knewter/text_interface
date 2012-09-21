class CanvasLayer
  attr_reader :canvas, :x, :y

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
end

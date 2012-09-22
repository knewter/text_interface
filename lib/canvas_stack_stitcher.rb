class CanvasStackStitcher
  attr_reader :canvas

  def initialize stack, stitcher_class
    @stack = stack
    @stitcher_class = stitcher_class
    reset_canvas
  end

  def reset_canvas
    layer = @stack.layers.first
    @canvas = layer.canvas.clone if layer
  end

  def execute!
    @stack.layers[1..-1].each do |layer|
      stitcher = @stitcher_class.new(layer.canvas, canvas, layer.x, layer.y)
      stitcher.execute!
    end
  end
end

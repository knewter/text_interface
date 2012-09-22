class CanvasStackStitcher
  def initialize stack, stitcher_class
    @stack = stack
    @stitcher_class = stitcher_class
  end

  def canvas
    layer = @stack.layers.first
    return unless layer
    canvas = layer.canvas.clone
    @stack.layers[1..-1].each do |layer|
      stitcher = @stitcher_class.new(layer.canvas, canvas, layer.x, layer.y)
      stitcher.execute!
    end
  end
end

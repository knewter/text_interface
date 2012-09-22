require_relative '../lib/text_interface'

def generate_layer(text)
  default_cell = lambda{ ' ' }
  canvas = CanvasCreator.new(text, Canvas, default_cell).generate_canvas
  CanvasLayer.new(canvas, 0, 0)
end

bottom = <<-EOF
--------
--------
--------
EOF

top = <<-EOF
o
EOF

bottom_layer = generate_layer(bottom)
@top_layer = generate_layer(top)

stack = CanvasStack.new
stack.add_layer(bottom_layer)
stack.add_layer(@top_layer)

@stitcher = CanvasStackStitcher.new(stack, CanvasStitcher)

def animate_top_layer(direction, amount)
  @top_layer.send("move_#{direction}", amount)

  @stitcher.reset_canvas
  @stitcher.execute!

  STDOUT.puts "\n" * 100
  STDOUT.puts CanvasPrinter.new(@stitcher.canvas).print
  sleep 0.05
end

animate_top_layer(:right, 0)

20.times do
  7.times { animate_top_layer(:right, 1) }
  2.times { animate_top_layer(:down, 1) }
  7.times { animate_top_layer(:left, 1) }
  2.times { animate_top_layer(:up, 1) }
end

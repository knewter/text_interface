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

@stitcher = CanvasStackStitcher.new(stack, CanvasStitcher, CanvasCloner, CanvasPrinter, CanvasCreator, Canvas, lambda{ '' })

def animate_top_layer(direction, amount)
  @top_layer.send("move_#{direction}", amount)

  @stitcher.reset_canvas
  @stitcher.execute!

  STDOUT.puts "\n" * 100
  STDOUT.puts CanvasPrinter.new(@stitcher.canvas).print
  sleep 0.05
end

animate_top_layer(:right, 0)

3.times do
  7.times { animate_top_layer(:right, 1) }
  2.times { animate_top_layer(:down, 1) }
  7.times { animate_top_layer(:left, 1) }
  2.times { animate_top_layer(:up, 1) }
end

STDOUT.puts "--- copycat time ---"
STDOUT.puts "--- copycat time ---"
STDOUT.puts "--- copycat time ---"
STDOUT.puts "--- copycat time ---"
STDOUT.puts "--- copycat time ---"

copycat = CanvasCloner.new(@stitcher.canvas, CanvasPrinter, CanvasCreator, Canvas, lambda{ '' }).clone
STDOUT.puts CanvasPrinter.new(copycat).print

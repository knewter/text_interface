require_relative '../lib/text_interface'

def generate_layer(text)
  default_cell = lambda{ ' ' }
  canvas = CanvasCreator.new(text, Canvas, default_cell).generate_canvas
  CanvasLayer.new(canvas, 0, 0)
end

bottom = <<-EOF
----------------
----------------
----------------
----------------
----------------
----------------
----------------
----------------
----------------
EOF

middle = <<-EOD
xx
xx
EOD

top = <<-EOF
o
EOF

bottom_layer = generate_layer(bottom)
middle_layer = generate_layer(middle)
top_layer = generate_layer(top)

stack = CanvasStack.new
stack.add_layer(bottom_layer)
stack.add_layer(middle_layer)
stack.add_layer(top_layer)

stitcher = CanvasStackStitcher.new(stack, CanvasStitcher)

def animate_layer(layer, direction, amount)
  layer.send("move_#{direction}", amount)
end

def render(stitcher)
  stitcher.reset_canvas
  stitcher.execute!

  STDOUT.puts "\n" * 100
  STDOUT.puts CanvasPrinter.new(stitcher.canvas).print
  sleep 0.05
end

def rendering stitcher, &block
  yield
  render(stitcher)
end

20.times do
  7.times do
    rendering(stitcher) do
      animate_layer(top_layer, :right, 1)
      animate_layer(middle_layer, :down, 1)
    end
  end

  7.times do
    rendering(stitcher) do
      animate_layer(top_layer, :down, 1)
      animate_layer(middle_layer, :right, 1)
    end
  end

  7.times do
    rendering(stitcher) do
      animate_layer(top_layer, :left, 1)
      animate_layer(middle_layer, :up, 1)
    end
  end

  7.times do
    rendering(stitcher) do
      animate_layer(top_layer, :up, 1)
      animate_layer(middle_layer, :left, 1)
    end
  end
end

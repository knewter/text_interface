require_relative '../lib/text_interface'

def generate_layer(text, x=0, y=0)
  default_cell = lambda{ ' ' }
  canvas = CanvasCreator.new(text, Canvas, default_cell).generate_canvas
  CanvasLayer.new(canvas, x, y)
end

bottom = <<-EOF
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
--------------------------------
EOF

middle = <<-EOD
xx
xx
EOD

top = <<-EOF
o
EOF

bottom_layer = generate_layer(bottom)
#middle_layer = generate_layer(middle)
top_layer = generate_layer(top, 10, 8)

stack = CanvasStack.new
stack.add_layer(bottom_layer)
#stack.add_layer(middle_layer)
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
  sleep 0.03
end

def rendering stitcher, &block
  yield
  render(stitcher)
end

while true do
  rendering(stitcher) do
    animate_layer(top_layer, :right, Math.sin(Time.now.to_f) / 5)
    animate_layer(top_layer, :down, Math.sin(Time.now.to_f + 1.5) / 10)
  end
end
#20.times do
  #7.times do
    #rendering(stitcher) do
      #animate_layer(top_layer, :right, 1)
      #animate_layer(middle_layer, :down, 1)
    #end
  #end
#end

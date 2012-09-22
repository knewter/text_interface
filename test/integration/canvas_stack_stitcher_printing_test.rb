require_relative '../test_helper'
require_relative '../../lib/canvas'
require_relative '../../lib/canvas_stitcher'
require_relative '../../lib/canvas_printer'
require_relative '../../lib/canvas_stack'
require_relative '../../lib/canvas_layer'
require_relative '../../lib/canvas_stack_stitcher'
require_relative '../../lib/canvas_creator'

describe "canvas stack stitching and printing" do
  it 'prints out a pathologically simple stitched up canvas stack' do
    bottom_text = <<-EOF
----
----
----
----
EOF

    printer = setup_stacks_and_printer([bottom_text])
    printer.print.must_equal "----\n----\n----\n----"
  end

  it 'prints out a basic stitched up canvas stack' do
    bottom_text = <<-EOF
----
----
----
----
EOF

    middle_text = <<-EOF
aaa
aaa
aaa
EOF

    top_text = <<-EOF
bb
bb
EOF

    printer = setup_stacks_and_printer([bottom_text, middle_text, top_text])
    printer.print.must_equal "bba-\nbba-\naaa-\n----"
  end
end

def setup_stacks_and_printer(stack_texts)
  default_cell = lambda{ ' ' }
  canvases = []
  stack_texts.each do |text|
    canvases << CanvasCreator.new(text, Canvas, default_cell).generate_canvas
  end

  layers = []
  canvases.each do |canvas|
    layers << CanvasLayer.new(canvas, 0, 0)
  end

  stack = CanvasStack.new
  layers.each {|l| stack.add_layer(l) }

  stitcher = CanvasStackStitcher.new(stack, CanvasStitcher)
  stitcher.execute!

  CanvasPrinter.new(stitcher.canvas)
end

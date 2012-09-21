require_relative '../test_helper'
require_relative '../../lib/canvas'
require_relative '../../lib/canvas_stitcher'
require_relative '../../lib/canvas_printer'

describe "canvas stitching and printing" do
  it 'prints out a basic stitched up canvas' do
    input_canvas = Canvas.new(1, 1, lambda{ ' ' })
    output_canvas = Canvas.new(10, 3, lambda{ 'a' })
    stitcher = CanvasStitcher.new(input_canvas, output_canvas, 2, 2)
    stitcher.execute

    printer = CanvasPrinter.new(output_canvas)
    printer.print.must_equal "aaaaaaaaaa\naaaaaaaaaa\naa aaaaaaa"
  end
end

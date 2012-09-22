require_relative '../test_helper'
require_relative '../../lib/canvas_stitcher'

describe CanvasStitcher do
  it 'stitches a one-line one-char input canvas into a one-line output canvas at the right point' do
    cell = mock()
    input_canvas = mock()
    input_canvas.stubs(:lines).returns [[cell]]
    output_canvas = mock()
    output_canvas.expects(:set_cell_at).with(0, 1, cell)

    stitcher = CanvasStitcher.new(input_canvas, output_canvas, 0, 1)
    stitcher.execute!
  end

  it 'stitches a one-line two-char input canvas into a one-line output canvas at the right point' do
    cell1 = mock()
    cell2 = mock()
    input_canvas = mock()
    input_canvas.stubs(:lines).returns [[cell1, cell2]]
    output_canvas = mock()
    output_canvas.expects(:set_cell_at).with(1, 0, cell1)
    output_canvas.expects(:set_cell_at).with(2, 0, cell2)

    stitcher = CanvasStitcher.new(input_canvas, output_canvas, 1, 0)
    stitcher.execute!
  end
end

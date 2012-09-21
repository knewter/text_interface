require_relative '../test_helper'
require_relative '../../lib/canvas_creator'

describe CanvasCreator do
  it 'can create a canvas from a text block' do
    text = <<-EOS
abcd
1234
EOS

    canvas_class = mock()
    canvas = mock()
    default_cell = lambda{ ' ' }

    canvas_class.expects(:new).with(4, 2, default_cell).returns(canvas)
    creator = CanvasCreator.new text, canvas_class, default_cell

    canvas.expects(:set_cell_at).with(0, 0, 'a')
    canvas.expects(:set_cell_at).with(1, 0, 'b')
    canvas.expects(:set_cell_at).with(2, 0, 'c')
    canvas.expects(:set_cell_at).with(3, 0, 'd')
    canvas.expects(:set_cell_at).with(0, 1, '1')
    canvas.expects(:set_cell_at).with(1, 1, '2')
    canvas.expects(:set_cell_at).with(2, 1, '3')
    canvas.expects(:set_cell_at).with(3, 1, '4')
    creator.generate_canvas
  end
end

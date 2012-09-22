require_relative '../test_helper'
require_relative '../../lib/canvas_cloner'

describe CanvasCloner do
  it 'takes in a given canvas and dependencies, and clones the canvas by converting through a printer and creator' do
    canvas = mock()
    printer_class = mock()
    printer = mock
    printer_class.expects(:new).with(canvas).returns(printer)
    string = mock()
    default_value = lambda{ '' }
    printer.expects(:print).returns(string)
    creator_class = mock()
    canvas_class = mock()
    creator = mock()
    cloned = mock
    creator.expects(:generate_canvas).returns(cloned)
    creator_class.expects(:new).with(string, canvas_class, default_value).returns(creator)

    cloner = CanvasCloner.new(canvas, printer_class, creator_class, canvas_class, default_value)

    cloner.clone.must_equal cloned
  end
end

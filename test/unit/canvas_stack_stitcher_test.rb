require_relative '../test_helper'
require_relative '../../lib/canvas_stack_stitcher'

describe CanvasStackStitcher do
  it "duplicates the lowest layer in the stack's canvas as its canvas" do
    @layer1 = mock
    @canvas1 = [['a']]
    @layer2 = mock
    @canvas2 = [['b']]
    @layer1.stubs(:canvas).returns(@canvas1)
    @layer2.stubs(:canvas).returns(@canvas2)
    @stack = mock
    @stack.stubs(:layers).returns([@layer1, @layer2])
    @stitcher_class = mock
    @stitcher = mock
    @stack_stitcher = CanvasStackStitcher.new @stack, @stitcher_class

    @stack_stitcher.canvas.must_equal @canvas1
    @stack_stitcher.canvas.object_id.wont_equal @canvas1.object_id
  end

  it 'stitches all of its layers together from the bottom of the stack up' do
    @layer1 = mock
    @canvas1 = [['a']]
    @layer2 = mock
    @canvas2 = [['b']]
    @layer1.stubs(:canvas).returns(@canvas1)
    @layer2.stubs(:canvas).returns(@canvas2)
    @layer2.expects(:x).returns(0)
    @layer2.expects(:y).returns(1)
    @stack = mock
    @stack.stubs(:layers).returns([@layer1, @layer2])
    @stitcher_class = mock
    @stitcher = mock
    @stack_stitcher = CanvasStackStitcher.new @stack, @stitcher_class

    @stitcher_class.expects(:new).with(@canvas2, @stack_stitcher.canvas, 0, 1).returns(@stitcher)
    @stitcher.expects(:execute!)
    @stack_stitcher.execute!
  end
end

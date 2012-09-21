require_relative '../test_helper'
require_relative '../../lib/canvas_layer'

describe CanvasLayer do
  before do
    @canvas = mock()
    @layer = CanvasLayer.new(@canvas, 5, 10)
  end

  it 'can be initialized with a canvas and coordinates' do
    @layer.canvas.must_equal @canvas
    @layer.x.must_equal 5
    @layer.y.must_equal 10
  end

  it 'can be moved left' do
    @layer.move_left(2)
    @layer.x.must_equal 3
  end

  it 'can be moved right' do
    @layer.move_right(3)
    @layer.x.must_equal 8
  end

  it 'can be moved up' do
    @layer.move_up(1)
    @layer.y.must_equal 9
  end

  it 'can be moved down' do
    @layer.move_down(2)
    @layer.y.must_equal 12
  end
end

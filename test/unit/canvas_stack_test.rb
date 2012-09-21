require_relative '../test_helper'
require_relative '../../lib/canvas_stack'

describe CanvasStack do
  before do
    @stack = CanvasStack.new
  end

  it 'keeps an array of layers' do
    @stack.layers.must_equal []
  end

  it 'can have a layer added to the stack' do
    layer = mock()
    @stack.add_layer layer
    @stack.layers.must_equal [layer]
  end

  it 'can have a layer removed from the stack' do
    layer = mock()
    @stack.add_layer layer
    @stack.remove_layer layer
    @stack.layers.must_equal []
  end

  it 'can have a layer added to the stack in a particular position' do
    layer1 = mock()
    layer2 = mock()
    layer3 = mock()
    @stack.add_layer layer1
    @stack.add_layer layer2, 0
    @stack.add_layer layer3, 1
    @stack.layers.must_equal [layer2, layer3, layer1]
  end
end

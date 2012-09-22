require_relative '../test_helper'
require_relative '../../lib/canvas_printer'

describe CanvasPrinter do
  it 'gets initialized with a canvas' do
    canvas = mock()
    printer = CanvasPrinter.new(canvas)
    printer.canvas.must_equal canvas
  end

  it 'prints out a single-line canvas' do
    canvas = mock()
    canvas.stubs(:lines).returns [%w(a b c d e f g)]
    printer = CanvasPrinter.new(canvas)
    printer.print.must_equal 'abcdefg'
  end

  it 'prints out a two line canvas' do
    canvas = mock()
    canvas.stubs(:lines).returns([%w(a b c d e f g), %w(1 2 3 4 5 6 7)])
    printer = CanvasPrinter.new(canvas)
    printer.print.must_equal "abcdefg\n1234567"
  end

  it 'prints out a three line canvas' do
    canvas = mock()
    canvas.stubs(:lines).returns([%w(a), %w(b), %w(c)])
    printer = CanvasPrinter.new(canvas)
    printer.print.must_equal "a\nb\nc"
  end

  it 'prints out a four line canvas' do
    canvas = mock()
    canvas.stubs(:lines).returns([%w(a), %w(b), %w(c), %w(d)])
    printer = CanvasPrinter.new(canvas)
    printer.print.must_equal "a\nb\nc\nd"
  end
end

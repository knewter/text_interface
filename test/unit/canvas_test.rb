require_relative '../test_helper'
require_relative '../../lib/canvas'

describe Canvas do
  it 'can be initialized with a size' do
    canvas = Canvas.new(10, 9, lambda{})
    canvas.lines.length.must_equal 9
    canvas.lines.each do |line|
      line.length.must_equal(10)
    end
  end

  it 'can get at a given cell' do
    cell = mock()
    canvas = Canvas.new(1, 1, lambda{ cell })
    canvas.cell_at(0, 0).must_equal cell
  end

  it 'can get at a given line' do
    cell = mock()
    canvas = Canvas.new(1, 1, lambda{ cell })
    canvas.line_at(0).must_equal [cell]
  end

  it 'can set a given cell value' do
    cell = mock()
    canvas = Canvas.new(1, 1, lambda{ cell })
    new_cell = mock()
    canvas.set_cell_at(0, 0, new_cell)
    canvas.cell_at(0, 0).must_equal new_cell
  end
end

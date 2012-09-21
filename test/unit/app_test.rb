require_relative '../test_helper'
require_relative '../../lib/app'

describe App do
  subject { App.new }

  it 'prints a line' do
    subject.print_line(10).must_equal '-' * 10
  end
end

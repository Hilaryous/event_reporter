gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/load'

class LoadTest < Minitest::Test
  attr_reader :load

  def setup
    data = ('./test/fixtures/event_attendees.csv')
    @load = Load.new(data)
  end

  def test_it_loads_data
    assert load
  end
end

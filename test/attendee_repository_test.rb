gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/attendee_repository'

class AttendeeRepositoryTest < Minitest::Test
  attr_reader :ar, :filename
  def setup
    @filename = './test/fixtures/event_attendees.csv'
    @ar = AttendeeRepository.load(filename, Attendee)
  end

  def test_it_exists
    assert ar
  end

  def test_it_loads_attendee_objects
    assert_equal 1, ar.objects[0].id.to_i
    assert_equal "Allison", ar.objects[0].first_name
  end
end

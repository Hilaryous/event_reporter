gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/attendee_repository'

class AttendeeRepositoryTest < Minitest::Test
  attr_reader :al, :filename
  def setup
    @filename = './test/fixtures/event_attendees.csv'
    @al = AttendeeRepository.new
  end

  def test_it_exists
    assert al
  end
end

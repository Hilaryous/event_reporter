require './test/test_helper'

class AttendeeRepositoryTest < Minitest::Test
  attr_reader :attendee_repo, :filename
  def setup
    @filename = './test/fixtures/event_attendees.csv'
    @attendee_repo = AttendeeRepository.load(filename, Attendee)
  end

  def test_it_exists
    assert attendee_repo
  end

  def test_it_loads_attendee_objects
    assert_equal 1, attendee_repo.attendee_collection[0].id.to_i
    assert_equal "Allison", attendee_repo.attendee_collection[0].first_name
  end
end

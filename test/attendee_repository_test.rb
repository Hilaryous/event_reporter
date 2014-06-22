gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/attendee_repository'

class AttendeeRepositoryTest < Minitest::Test
  attr_reader :al, :filename
  def setup
    @filename = './test/fixtures/event_attendees.csv'
    @al = AttendeeLoader.new
  end

  def test_it_exists
    assert al
  end

  def test_it_loads_csv_data
    assert al.load(filename)
  end

  def test_assign_data_to_rows
    data = al.load(filename)
    al.assign_rows(data)
    assert al.rows
  end
end

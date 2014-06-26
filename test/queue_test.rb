require './test/test_helper'
class TheQueueTest < Minitest::Test
  # repository = AttendeeReposito
  # attendee = Attendee.new(entry)#'./test/fixtures/event_attendees.csv')

  def entry
      {
        id: 1,
        regdate:       'July 1, 2013',
        first_name:    'JOn',
        last_name:     'SnoW',
        email_address: 'hello@hello.com',
        homephone:     "1123456789",
        street:        '109 street',
        city:          'atlanta',
        state:         'ga',
        zipcode:       '12345'
      }
  end

  attr_reader :queue
  def setup
    attendee = Attendee.new(entry)
    @queue   = TheQueue.new
    @queue << attendee
  end

  def test_it_exists
    assert queue
  end

  def test_it_counts_the_queue
    assert_equal 1, queue.count_data
  end

  def test_it_clears_the_queue
    queue.clear_data
    assert queue.current.empty?
  end

  def test_it_executes_print
    assert queue.print_data_table
  end

  def test_it_executes_print_by
    assert queue.print_by(:first_name)
  end

  def test_it_save_to
    filename = 'empty'
    assert_match /empty/, queue.save_to(filename)
  end
end

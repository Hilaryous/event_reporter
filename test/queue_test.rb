gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/queue'
require './lib/attendee_repository'

require 'pry'

class TheQueueTest < Minitest::Test
  attr_reader :find_results, :queue
  def setup
    attendee_repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    @queue = attendee_repo.find(:first_name, 'Sarah')
  end

  def test_it_exists
    assert queue
  end

  def test_it_counts_the_queue
    assert_equal 2, queue.count
  end
end

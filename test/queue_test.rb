gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/queue'
require './lib/attendee_repository'
require './lib/event_reporter'

class TheQueueTest < Minitest::Test
  attr_reader :find_results, :queue, :repo
  def setup
    @repo = AttendeeRepository.load_csv('./test/fixtures/event_attendees.csv', Attendee)
    @event_reporter = EventReporter.new(repo, TheQueue.new)
    @queue = @event_reporter.queue
    @event_reporter.find(:first_name, 'Sarah')
  end

  def test_it_exists
    assert queue
  end

  def test_it_counts_the_queue
    assert_equal 2, queue.count_data
  end

  def test_it_clears_the_queue
    queue.clear_data
    assert queue.current.empty?
  end

  def test_it_executes_print
    assert_equal "Hi", queue.print_data_table
  end

  def test_it_executes_print_by
    assert_equal "Hello", queue.print_by
  end

  def test_it_save_to
    filename = 'empty'
    assert_equal nil, queue.save_to(filename)
  end
end

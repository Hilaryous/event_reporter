gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/event_reporter'

class EventReporterTest < Minitest::Test
  attr_reader :repo, :event_reporter
  def setup
    @repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    @event_reporter = EventReporter.new(repo)
    @queue = event_reporter.find(:first_name, 'Sarah')
    @queue = event_reporter.find(:first_name, 'Aya')
  end

  def test_it_executes_find
    @find_one
    @find_two
  end

  def test_it_executes_count
    assert_equal 3, @queue.count
  end

  def test_it_executes_clear
    assert 0, @queue.clear.count
  end

  def test_it_executes_print
    assert_equal "Hi", @queue.print_data_table
  end

  def test_it_executes_print_by
    assert_equal "Hello", @queue.print_by
  end

  def test_it_save_to
    assert_equal "Hey", @queue.save_to
  end
end

require './test/test_helper'
class EventReporterTest < Minitest::Test
  attr_reader :repo, :event_reporter, :queue
  def setup
    @repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    @event_reporter = EventReporter.new(repo, TheQueue.new)
    @queue = @event_reporter.queue
    event_reporter.find(:first_name, 'Sarah')
    event_reporter.find(:first_name, 'Aya')
  end

  def test_it_executes_count
    assert_equal 3, @queue.count_data
  end

  def test_it_executes_clear
    @queue.clear_data
    assert 0, @queue.count_data
  end

  def test_it_executes_print
    skip
    # fix once print is finished
    assert_equal "Hi", @queue.print_data_table
  end

  def test_it_executes_print_by
    skip
    # fix now that print_by is finished
    assert_equal "Hello", @queue.print_by
  end

  def test_it_save_to
    filename = "empty"
    assert_match /file/, @queue.save_to(filename)
  end
end

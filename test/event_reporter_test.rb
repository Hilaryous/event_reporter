require './test/test_helper'
class EventReporterTest < Minitest::Test
  attr_reader :repo, :event_reporter
  def setup
    @repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    @event_reporter = EventReporter.new(repo, TheQueue.new)
    event_reporter.find(:first_name, 'Sarah')
    event_reporter.find(:first_name, 'Aya')
  end

  def test_it_executes_count
    assert_equal 1, event_reporter.count_data
  end

  def test_it_finds
    event_reporter.find(:first_name, 'Sarah')
    assert_equal 2, event_reporter.count_data
  end
  def test_it_executes_clear
    @event_reporter.clear_data
    assert 0, event_reporter.count_data
  end

  def test_it_executes_print
    assert_output (/FIRST NAME/){event_reporter.print_data_table}
  end

  def test_it_executes_print_by
    assert_output (/FIRST NAME/){event_reporter.print_by(:first_name)}
  end

  def test_it_save_to
    assert_output (/file/) {event_reporter.save_to('file')}
  end
end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/event_reporter'

class EventReporterTest < Minitest::Test
  def test_it_executes_find
    repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    er = EventReporter.new(repo)
    er.find(:first_name, 'Sarah')
    er.find(:first_name, 'Aya')
    puts er.queue.class
    puts er.queue.inspect
  end
end

require './lib/attendee_repository'

class EventReporter
  attr_reader :queue
  def initialize(repository='./test/fixtures/event_attendees.csv')
    @repository = repository
    @queue = nil
  end

  def find(attribute, value='filename')
    @queue = @repository.find(attribute, value)
  end

  def count
    @queue.count
  end
  ## this will have all the queue methods called
end

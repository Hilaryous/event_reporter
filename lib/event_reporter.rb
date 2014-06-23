class EventReporter
  def initialize(repository='./test/fixtures/event_attendees.csv')
    @repository = repository
  end

  def find(attribute, value='filename')
    # when implemented will call AttendeeRepository#find
    # Queue instance will be called
    # when do new find queue will be cleared
    "attribute: #{attribute}"
  end

  ## this will have all the queue methods called
end

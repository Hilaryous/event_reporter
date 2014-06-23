class EventReporter
  def initialize(repository='./test/fixtures/event_attendees.csv')
    @repository = repository
  end

  def find(attribute, value='filename')
    # when implemented will call AttendeeRepository#find
    "attribute: #{attribute}"
  end
end

